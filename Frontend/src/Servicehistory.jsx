import React, { useEffect, useState } from 'react';
import api from './api';

function Servicehistory() {

  const [data, setData] = useState([]);

  // useEffect(() => {

  //   const auth = JSON.parse(localStorage.getItem("auth"));
  //   const user = auth?.user_id;

  //   if (!user) return;

  //   api.get(`bookingdatabycustomer/${user}/`)
  //     .then(res => setData(res.data))
  //     .catch(err => console.log(err));

  // }, []);
  useEffect(() => {
  api.get("bookingdatabycustomer/")
    .then(res => {
      console.log("API hit", res.data);
      setData(res.data);
    })
    .catch(err => console.log(err));
}, []);


  return (
    <div className="container mt-3">
      <h3>My Bookings</h3>

      {data.length === 0 ? (
        <p>No bookings found</p>
      ) : (
        data.map((item) => (
          <div key={item.id} className="card p-3 mb-2">
            <p><strong>Provider:</strong>{item.provider_name}</p>
            <p><strong>Service:</strong> {item.service_name}</p>
            <p><strong>Date:</strong> {item.date}</p>
            <p><strong>Time:</strong> {item.time}</p>
            <p><strong>Status:</strong>{item.status}</p>
          </div>
        ))
      )}

    </div>
  );
}

export default Servicehistory;
