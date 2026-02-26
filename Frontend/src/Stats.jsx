import React, { useEffect, useState } from 'react';
import api from './api';
import './adminnav.css';

function Stats() {
    const [stats,setStats]=useState(null)
    useEffect(()=>{
        api.get('admindashboardstats')
        .then(res=>{setStats(res.data);console.log(res.data)})
        .catch(err=>console.log(err.data))
    },[])
  return (
    <div className='admin stats p-3 card admindashboard nav' style={{height:'80vh',marginTop:'-18px'}}>
     {
       stats ? (
        <div className='d-flex flex-wrap gap-2'>
            <div className='card  p-3' style={{width:'200px',backgroundColor:'orange',color:'white',fontWeight:'bolder',fontSize:'20px'}}>
            <p>Total Users</p>
            {stats.total_users}
            </div>

            <div className='card p-3'style={{width:'200px' ,backgroundColor:'orange',color:'white',fontWeight:'bolder',fontSize:'20px'}}>
            <p>Total Customers</p>
            {stats.customers}
            </div>

            <div className='card p-3'style={{width:'200px',backgroundColor:'orange',color:'white',fontWeight:'bolder',fontSize:'20px'}}>
            <p>Total Providers</p>
            {stats.providers}
            </div>

            <div className='card p-3' style={{width:'200px',backgroundColor:'orange',color:'white',fontWeight:'bolder',fontSize:'20px'}}>
            <p>Total Bookings</p>
            {stats.total_bookings}
            </div>

            <div className='card p-3' style={{width:'200px',backgroundColor:'orange',color:'white',fontWeight:'bolder',fontSize:'20px'}}>
            <p>Pending</p>
            {stats.pending}
            </div>

            <div className='card p-3' style={{width:'200px',backgroundColor:'orange',color:'white',fontWeight:'bolder',fontSize:'20px'}}>
            <p>Completed</p>
            {stats.completed}
            </div>

            <div className='card p-3' style={{width:'200px',backgroundColor:'orange',color:'white',fontWeight:'bolder',fontSize:'20px'}}>
            <p>Cancelled</p>
            {stats.cancelled}
            </div>

            <div className='card p-3' style={{width:'200px',backgroundColor:'orange',color:'white',fontWeight:'bolder',fontSize:'20px'}}>
            <p>Approved Providers</p>
            {stats.approved_provider}
            </div>
            
        </div>
       ):(
        <p>No record Found</p>
       )
     }
    </div>
  );
}

export default Stats;
