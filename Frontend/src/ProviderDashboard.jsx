import React, { useEffect, useState } from 'react';
import api from './api';

function ProviderDashboard() {
    const [work,setWork]=useState([]);
    const [error,setError]=useState();
    const [message,setMessage]=useState('');
    useEffect(()=>{
        api.get('providerdashboard')
        .then(res=>{setWork(res.data);console.log(res.data)})
        .catch(err=>setError(err.data || 'No record Found'))

    },[])
    function compleatedwork(id){

    const result = window.confirm("Are you sure to complete this work?");

    if (!result) return;

    const status = 'completed';

    api.patch(`changeworkstatus/${id}/${status}`)
        .then(() => {
            alert('Work completed');
            window.location.reload();
        })
        .catch(err => setMessage(err.response?.data || 'Error'));
    }

    function rejectwork(id){
        const result = window.confirm("Are you sure to cancel this work?");

    if (!result) return;

    const status = 'cancel';

    api.patch(`changeworkstatus/${id}/${status}`)
        .then(() => {
            alert('Work cancel');
            window.location.reload();
        })
        .catch(err => setMessage(err.response?.data || 'Error'));
        
        
    }
  return (
    <div className='d-flex gap-2 container flex-wrap flex-direction-row'>
        {work && work.length > 0 ? (
            work.map((item) => (
                <div >
                    <div key={item.id} className='card text-center p-5' >
                    <p><strong>Customer Name:</strong>{item.customer_name}</p>
                    <p><strong>Service want:</strong>{item.service_name} work</p>
                    <p><strong>Date:</strong>{item.date}</p>
                    <p><strong>Time:</strong>{item.time}</p>
                    <p><strong>Status:</strong>{item.status}</p>
                    <p><strong>Customer mobile:</strong>{item.customer_phone}</p>
                    <p><strong>Customer address:</strong>{item.customer_address}</p>
                    <button onClick={() => compleatedwork(item.id)}  disabled={!['pending', 'work pending'].includes(item.status)} className='btn btn-success mt-2'>Compleated</button>
                    <button onClick={()=>rejectwork(item.id)}  disabled={!['pending', 'work pending'].includes(item.status)} className='btn btn-danger mt-2'>Cancel</button>
                   
                    </div>
                    {message}
                </div>
                
            ))
            ) : (
            <p>{error}</p>
            )}
    </div>
  );
}

export default ProviderDashboard;
