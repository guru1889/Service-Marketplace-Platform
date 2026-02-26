import axios from "axios";

const api = axios.create({
  baseURL: "http://127.0.0.1:8000/",
});

// -------------------------
// REQUEST INTERCEPTOR
// -------------------------
api.interceptors.request.use((config) => {
  const authString = localStorage.getItem("auth");

  if (authString) {
    const auth = JSON.parse(authString);

    if (auth?.access) {
      config.headers.Authorization = `Bearer ${auth.access}`;
    }
  }

  return config;
});

// -------------------------
// REFRESH CONTROL
// -------------------------
let isRefreshing = false;
let refreshSubscribers = [];

function subscribeTokenRefresh(callback) {
  refreshSubscribers.push(callback);
}

function onRefreshed(newToken) {
  refreshSubscribers.forEach((callback) => callback(newToken));
  refreshSubscribers = [];
}

// -------------------------
// RESPONSE INTERCEPTOR
// -------------------------
api.interceptors.response.use(
  (response) => response,
  async (error) => {
    const originalRequest = error.config;

    if (error.response?.status !== 401) {
      return Promise.reject(error);
    }

    if (originalRequest._retry) {
      localStorage.removeItem("auth");
      window.location.href = "/login";
      return Promise.reject(error);
    }

    if (isRefreshing) {
      return new Promise((resolve) => {
        subscribeTokenRefresh((newToken) => {
          originalRequest.headers.Authorization = `Bearer ${newToken}`;
          resolve(api(originalRequest));
        });
      });
    }

    originalRequest._retry = true;
    isRefreshing = true;

    try {
      const auth = JSON.parse(localStorage.getItem("auth"));
      const refreshToken = auth?.refresh;

      if (!refreshToken) {
        throw new Error("No refresh token");
      }

      const response = await api.post("api/token/refresh/", {
        refresh: refreshToken,
      });

      const newAccess = response.data.access;

      auth.access = newAccess;
      localStorage.setItem("auth", JSON.stringify(auth));

      api.defaults.headers.common.Authorization = `Bearer ${newAccess}`;

      onRefreshed(newAccess);

      return api(originalRequest);

    } catch (err) {
      localStorage.removeItem("auth");
      window.location.href = "/login";
      return Promise.reject(err);
    } finally {
      isRefreshing = false;
    }
  }
);

export default api;