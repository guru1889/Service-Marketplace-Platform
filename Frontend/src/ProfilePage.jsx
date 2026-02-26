import React, { useEffect } from 'react';
import profileicon from './assets/person-circle.svg'
import { useNavigate } from 'react-router-dom';
import { useAuth } from "./Auth_context";

function ProfilePage() {

  const { auth, logout } = useAuth();
  const nav = useNavigate();

  useEffect(() => {
    if (!auth) {
      nav('/login');
    }
  }, [auth, nav]);

  if (!auth) {
    return null; // prevent crash during first render
  }

  function handlelogout() {
    logout();
    nav('/login');
  }

  return (
    <div className='container'>
      <img src={profileicon} alt="" width={100}/>
      <p>Name: {auth.user?.username}</p>
      <p>Mobile: {auth.profile?.phone_number}</p>
      <button className='warning' onClick={handlelogout}>Logout</button>
    </div>
  );
}

export default ProfilePage;