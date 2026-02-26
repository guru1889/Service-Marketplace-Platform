import axios from 'axios';
import React, { useState ,useEffect} from 'react';
import { Link } from 'react-router-dom';



function RegisterPage() {
    const [password,setPassword]=useState();
    const [confirmpassword,setConfirmpassword]=useState();
    const[ispending,setIspending]=useState(false)
    const[error,setError]=useState();
    const[message,setMessage]=useState();
    const[passmatch,setPassmatch]=useState();
    
    const [alert,setAlert]=useState();
     useEffect(() => {
        if (!password || !confirmpassword) {
            setPassmatch('');
            return;
        }

        if (password === confirmpassword) {
            setPassmatch('Password match');
        } else {
            setPassmatch('Password mismatch');
        }
        }, [password, confirmpassword]);

        async function registervalidate(e){
            e.preventDefault();
            setIspending(true)
            const formData = new FormData(e.target);
            const data = Object.fromEntries(formData);

            axios.post("http://127.0.0.1:8000/register/", data)
            .then(res => {
                const msg = res.data.message || "Registration successful";
                setMessage(msg);
                setAlert(msg);   // ✅ SAME VALUE
                e.target.reset();
                setPassmatch('');
                setPassword('');
                setConfirmpassword('');
            })

            .catch((err) => {
            let errMsg = "Network error";
            if (err.response) {
                errMsg = JSON.stringify(err.response.data);
            }
            setError(errMsg);
            setAlert(errMsg);
            })
            
            .finally(() => setIspending(false))
            
            // const res= await fetch(
            //     'http://127.0.0.1:8000/register/',{
            //         method:'POST',
            //         headers:{
            //             'content-type':'application/json',
            //         },
            //         body:JSON.stringify()
            //     })
            //     .then(res=>{res.json();setMessage(res)})
            //     .catch(err=>{err.json;setError(err)})

            // const data=await res.json();
            // return data.message || data.serializer.error_messages 
            

        }
        
        

  return (
    <div className="row justify-content-center">
  <div className=" card col-sm-4">
    <form onSubmit={registervalidate} >
        <div className="  text-center p-5">
      <h2 className="text-primary">Register Form</h2>
      <input type="text" className='form-control mt-2' name='username' placeholder='Enter Username' />
      <input type="text" name='phone_number' placeholder='Phone number' className='form-control mt-2'/>
      <input type="text" name='address' placeholder='address' className='form-control mt-2' />
      <input type="email" name='email' placeholder='example@gmail.com' className='form-control mt-2' />
      <input onChange={(e)=>setPassword(e.target.value)} type="password" className='form-control mt-2' name='password' placeholder=' Password'/>
      <input onChange={(e)=>{setConfirmpassword(e.target.value);}} type="password" className='form-control mt-2' name='confirmpassword' placeholder='Confirm Password'/>
      <button
  className="btn btn-primary mt-2"
  disabled={ispending || password !== confirmpassword}
>
  {ispending ? "Registering..." : "Submit"}
</button>

      {password}<br/>

      {confirmpassword}
      {passmatch}
      <br />
      {alert && <p>{alert}</p>}

    </div>
    </form>
    <Link to={'/providerregistraion'}>you are service provider Click hear for registration?</Link>
  </div>
  
</div>

  );
}

export default RegisterPage;
