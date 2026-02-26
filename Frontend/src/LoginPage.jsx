import React, { useState } from 'react';
import axios from 'axios';
import { useAuth } from "./Auth_context";
import { useNavigate } from 'react-router-dom';
import api from './api';

function LoginPage() {
  const nav = useNavigate();
  const { login } = useAuth();   // ✅ ONLY place useAuth is called

  const [ispending, setIspending] = useState(false);
  const [message, setMessage] = useState('');
  const [data,setData]=useState()
  async function handlesubmit(e) {
  e.preventDefault();
  setIspending(true);
  setMessage("");

  const data = Object.fromEntries(new FormData(e.target));
  console.log("Sending:", data);
  api.post('/login/', data)
  .then(res => {

    const authData = {
      user: res.data.user,
      profile: res.data.profile,
      access: res.data.access,
      refresh: res.data.refresh
    };

    login(authData);
    setIspending(false);
    const auth = JSON.parse(localStorage.getItem("auth"));
    if(auth.user.role == 'customer'){
      nav('/dashboard')
    }
    if(auth.user.role == 'service_provider'){
      nav('/providerdashboard')
    }
    if(auth.user.role =='admin'){
      nav('/admindashboard')
    }
    

  })
  .catch(err => {
    setMessage(
      err.response?.data?.message || "Invalid credentials"
    );
    setIspending(false);
  });

  
}

  return (
    <div className="row justify-content-center">
      <div className="col-sm-4">
        <form onSubmit={handlesubmit}>
          <div className="card text-center p-5">
            <h2 className="text-primary">Login</h2>

            <input
              type="text"
              className="form-control mt-2"
              name="username"
              placeholder="Enter Username"
            />

            <input
              type="password"
              className="form-control mt-2"
              name="password"
              placeholder="Password"
            />

            <button className="btn btn-primary mt-2" disabled={ispending}>
              {ispending ? "Logging..." : "Login"}
            </button>
          </div>
        </form>

        {message && <p className="text-danger mt-2">{message}</p>}
      </div>
    </div>
  );
}

export default LoginPage;
