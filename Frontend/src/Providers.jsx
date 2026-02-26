import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from "react-router-dom";
import api from './api';
import Filterprovider from './Filterprovider';
function Providers() {
    const [providers,setProviders]=useState([]);
    const [allProviders, setAllProviders] = useState([]);

    const [error,setError]=useState();
    useEffect(()=>{
        api.get('/service_providers')
        .then(res=>{setProviders(res.data);setAllProviders(res.data)})
        .catch(err=>setError(err))
        
    },[])
    useEffect(() => {
    console.log(providers);
}, [providers]);

    
  return (
    <div >
        <div className='container 'style={{border:'1 black solid'}} >
        <Filterprovider 
            providers={providers}
            allProviders={allProviders}
            setProviders={setProviders}
        />



        <div className='d-flex flex-wrap  pt-4 gap-3' style={{paddingLeft:'100px',backgroundColor:'#f5f0f0'}}>
        
        {
            providers && providers.length > 0 ? (
                providers.map((data) => (
                <div className="card p-3" key={data.id}>
                    <div className='img-top'>
                        <img src={`http://127.0.0.1:8000${data.image}`} alt="provider"  height={200}/></div>
                    
                    <p>Name: {data.provider}</p>
                    <p>Service: {data.service}</p>
                    <p>Service Charge: {data.salary}</p>
                    {data.location && <p>Location:{data.location}</p> }
                    <p>
                    Approved: {data.approved ? (
                        <span className="text-success">
                        <i className="bi bi-patch-check-fill"></i> Approved
                        </span>
                    ) : (
                        <span className="text-danger">
                         Not Approved
                        </span>
                    )}
                    </p>
                    <Link to={`/bookservice/${data.id}`}>Book</Link>
                    
                    
                </div>
                ))
            ) : (
                <p>{error || "No record found"}</p>
            )
            }

      
    </div>
    </div>
    </div>
    
    
  );
}

export default Providers;
