import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from "react-router-dom"

import './index.css'
import Layout from "./Layout"
import Home from "./Home"
import LoginPage from "./LoginPage"
import RegisterPage from "./RegisterPage"
import AboutPage from "./AboutPage"
import ProfilePage from './ProfilePage'
import Providers from './Providers'
import { AuthProvider } from "./Auth_context"   // ✅ ADD THIS
import ProviserRegistration from './ProviserRegistration'
import BookService from './BookService'
import ProtectedRoute from "./ProtectedRoute";
import Servicehistory from './Servicehistory'
import ProviderDashboard from './ProviderDashboard'
import AdminPgage from './AdminPgage'
import Stats from './Stats'
import ProviderApproval from './ProviderApproval'

import { Navigate } from 'react-router-dom'
import ProviderUnavilabilityupdate from './ProviderUnavilability'


const router = createBrowserRouter([
  {
    path: "/",
    element: <Layout />,
    errorElement: <h1>404 - Page Not Found</h1>,
    children: [
      { index: true, element: <Home /> },
      { path: "login", element: <LoginPage /> },
      { path: "signup", element: <RegisterPage /> },
      { path: "about_us", element: <AboutPage /> },

      

      {
        path: "dashboard",
        element: (
          <ProtectedRoute>
            <Providers />
          </ProtectedRoute>
        ),
      },
    {
      path: "admindashboard",
      element: (
        <ProtectedRoute>
          <AdminPgage />
        </ProtectedRoute>
      ),
      children: [
        { index: true, element: <Navigate to="stats" /> },
        { path: "stats", element: <Stats /> },
        { path: "providerapproval", element: <ProviderApproval /> }
      ]
    },
      {
        path: "service",
        element: (
          <ProtectedRoute>
            <Servicehistory/>
          </ProtectedRoute>
        ),
      },
      {
        path: "providerdashboard",
        element: (
          <ProtectedRoute>
            <ProviderDashboard/>
          </ProtectedRoute>
        ),
      },
      {
        path: "providerunavilable",
        element: (
          <ProtectedRoute>
            <ProviderUnavilabilityupdate/>
          </ProtectedRoute>
        ),
      },
      
      

      {
        path: "profile",
        element: (
          <ProtectedRoute>
            <ProfilePage />
          </ProtectedRoute>
        ),
      },

      {
        path: "bookservice/:id",
        element: (
          <ProtectedRoute>
            <BookService />
          </ProtectedRoute>
        ),
      },

      { path: "providerregistraion", element: <ProviserRegistration /> },
    ],
  },
]);


createRoot(document.getElementById('root')).render(
  <StrictMode>
    <AuthProvider>          {/* 🔥 THIS IS THE KEY */}
      <RouterProvider router={router}/>
    </AuthProvider>
  </StrictMode>
)
