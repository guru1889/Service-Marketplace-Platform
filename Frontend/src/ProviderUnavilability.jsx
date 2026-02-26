import React, { useState } from 'react';
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import api from './api';

function ProviderUnavilabilityupdate() {

    const [date, setDate] = useState(null);
    const [message, setMessage] = useState("");

    function Updateleave(e) {
        e.preventDefault();

        if (!date) {
            setMessage("Please select a date");
            return;
        }

        const cleanDate =
                date.getFullYear() + "-" +
                String(date.getMonth() + 1).padStart(2, "0") + "-" +
                String(date.getDate()).padStart(2, "0");

        api.post("/providerunavilability", {
            date: cleanDate
        })
        .then(res => {
            console.log(res.data);
            setMessage("Unavailable date added successfully");
        })
        .catch(err => {
            console.log(err.response?.data);
            setMessage("Something went wrong");
        });
    }

    return (
        <div className='text-center'>
            
            <DatePicker
                selected={date}
                onChange={(selectedDate) => setDate(selectedDate)}
                minDate={new Date()}
                inline
            />

            <br />

            <button 
                className='btn btn-warning mt-3'
                onClick={Updateleave}
            >
                Fix Unavailable
            </button>

            <br />

            {message && <p>{message}</p>}
        </div>
    );
}

export default ProviderUnavilabilityupdate;