import React, { useEffect, useState } from 'react';
import api from './api';
import './adminnav.css';

function ProviderApproval() {
    const [unapprovedprovider,setUnapprovedprovider]=useState([]);
    const [message,setMessage]=useState();
    useEffect(()=>{
        api.get('unapprovedprovider')
        .then(res=>{console.log(res.data);setUnapprovedprovider(res.data)})
    },[message])
    function sanctionApproved(id) {
        api.post(`sanctionapproved/${id}/`)
        .then(res => {console.log(res.data);alert('You give approved');window.location.reload()})
        .catch(err => console.log(err.response?.data || "Error"));
    }
  return (
    <div className='admin provider_approval card p-3 ' style={{height:'80vh',marginTop:'-18px'}}>
        <div >
            <div className='d-flex flex-wrap gap-5'>
                {unapprovedprovider.map((data)=>(
                    <div className='card p-3 ' key={data.id}>
                        <div className='card-body'>
                            <img src={`http://127.0.0.1:8000/${data.image}`} width={150}  alt="" className='image-top'/>
                        <p><strong>Name:</strong>{data.provider_name}</p>
                        <p><strong>Service:</strong>{data.service_name}</p>
                        <p><strong>Phone:</strong>{data.provider_phone}</p>
                        <p><strong>Location:</strong>{data.location}</p>
                        <p>
                            <strong>Status:</strong>{" "}
                            {data.approved ? "Approved" : "Pending"}
                            </p>
                        <button className='btn btn-success' onClick={()=>sanctionApproved(data.id)}>approved</button>
                        </div>
                        
                        
                    </div>

                ))}
            </div>
        </div>
        
      
    </div>
  );
}

export default ProviderApproval;
