import React from 'react';

import banner from "./assets/banner.png";
import electrician from "./assets/electrician.jpg";
import plumber from "./assets/plumber.jpg";
import acmechanic from "./assets/acmechanic.jpg"
import painter from './assets/painter.jpg';


function Home() {
  const userData = JSON.parse(localStorage.getItem("user"));
  console.log(userData)
  return (
    <>
    
    <div className='body mt-5'>
      <div className='container '>
        <div className='' width="">
            <img src={banner} width="100%"  alt="" />
        </div>
        <div className='row g-1 mt-3 container col-sm-12'>
          <h2>Our Service provide</h2>
            <div className=' card col-sm-3'>
                <div className='card-body'>
                    <img src={electrician} className='card-img-top' alt="" /> 
                  <h5 className='card-title'>Electrecian</h5>                
                </div>
            </div>
            <div className=' card col-sm-3'>
                <div className='card-body'>
                    <img src={plumber} className='card-img-top' alt="" />  
                    <h5 className='card-title'>plumber</h5>               
                </div>
            </div>
            <div className=' card col-sm-3'>
                <div className='card-body'>
                    <img src={acmechanic} className='card-img-top' alt="" />   
                    <h5 className='card-title'>Ac Mechanic</h5>              
                </div>
            </div>
            <div className=' card col-sm-3'>
                <div className='card-body'>
                    <img src={painter} className='card-img-top' alt="" />  
                    <h5 className='card-title'>painter</h5>               
                </div>
            </div>

        </div>
        <div>
          <p>At Hehit, we believe that finding a trustworthy technician shouldn’t be a chore. We started with a simple mission: to bridge the gap between local homeowners and skilled professionals. Whether it’s a flickering light or a leaky pipe, our system is designed to get the right expert to your doorstep, fast.</p>

        </div>
      </div>
    </div>
    
    </>
  );
}

export default Home;
