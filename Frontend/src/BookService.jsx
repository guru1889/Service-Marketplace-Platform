import "./booking.css";

import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import { parse, format, addHours } from "date-fns";
import axios from "axios";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import api from "./api";


function BookService() {
  const { id } = useParams();

  const [provider, setProvider] = useState(null);
  const [message, setMessage] = useState("");
  const [unavailableDates, setUnavailableDates] = useState([]);
  const [date, setDate] = useState(null);
  const [selectedSlot, setSelectedSlot] = useState("");
  const [bookedSlots, setBookedSlots] = useState([]);
  const [bookingMessage, setBookingMessage] = useState("");

  useEffect(() => {

  if (!id) return;

  api.get(`get-provider-unavailable-dates/${id}/`)
    .then(res => {

      // Convert string dates → Date objects
      const convertedDates = res.data.map(dateString => 
        new Date(dateString)
      );

      setUnavailableDates(convertedDates);

    })
    .catch(err => 
      console.log(err.response?.data)
    );

}, [id]);
  // 🔹 Fetch Provider Details
  useEffect(() => {
    const fetchProvider = async () => {
      try {
        const res = await api.get(
          `getprovider/${id}`
        );
        setProvider(res.data);
      } catch (error) {
        setMessage("Failed to load provider");
      }
    };

    fetchProvider();
  }, [id]);

  // 🔹 Generate 2-hour slots (9AM–7PM with 1–3PM break)
  function generateSlots() {
    const slots = [];
    const workingStart = 9;
    const workingEnd = 19;
    const breakStart = 13;
    const breakEnd = 15;
    const duration = 2;

    let current = workingStart;

    while (current + duration <= workingEnd) {
      if (current >= breakStart && current < breakEnd) {
        current = breakEnd;
        continue;
      }

      slots.push(current.toString().padStart(2, "0") + ":00");
      current += duration;
    }

    return slots;
  }

  const timeSlots = generateSlots();

  // 🔹 Fetch booked slots when date changes
  useEffect(() => {
    if (!date) return;

    const fetchBookedSlots = async () => {
      try {
        const formattedDate = date.toISOString().split("T")[0];

        const res = await axios.get(
          `http://127.0.0.1:8000/getBookedSlots/${id}/${formattedDate}/`
        );

        setBookedSlots(res.data);
      } catch (error) {
        console.log("Failed to fetch booked slots");
      }
    };

    fetchBookedSlots();
  }, [date, id]);

  // 🔹 Format slot range to AM/PM
  function formatSlotRange(slot) {
    const parsedStart = parse(slot, "HH:mm", new Date());
    const parsedEnd = addHours(parsedStart, 2);

    return `${format(parsedStart, "hh:mm a")} - ${format(
      parsedEnd,
      "hh:mm a"
    )}`;
  }

  // 🔹 Booking Function
const handleBooking = async () => {

  if (!date || !selectedSlot) {
    setBookingMessage("Please select date and time slot");
    return;
  }


    const formattedDate = date.toISOString().split("T")[0];

    

    

    api.post('/bookappointment/',{
        provider_id: provider.id,
        date: formattedDate,
        time: selectedSlot,
      })
      .then(res=>{setBookingMessage(res.data.message)
        
      setBookedSlots([...bookedSlots, selectedSlot]);
      setSelectedSlot("");
      })
      .catch(error=>setBookingMessage(error.response?.data?.error))


    };



  return (
    <div className="container mt-4">

      {message && <p>{message}</p>}

      {provider && (
        <div className="row">

          {/* LEFT SIDE - PROVIDER */}
          <div className="col-md-5">
            <div className="card  shadow-sm" >
              <img className="image-top"
                src={`http://127.0.0.1:8000${provider.image}`}
                
                
                alt=""
              />
              <div className="card-body">
                <h5>{provider.provider}</h5>
                <p><strong>Service:</strong> {provider.service}</p>
                <p><strong>Salary:</strong> ₹{provider.salary}</p>
                <p>
                  <strong>Approved Status:</strong>{" "}
                  {provider.approved ? "YES" : "NO"}
                </p>
              </div>
            </div>
          </div>

          {/* RIGHT SIDE - BOOKING */}
          <div className="col-md-7">
            <div className="card booking-card p-4 shadow-sm">
              <h4>Book Appointment</h4>

              {/* Calendar */}
              <DatePicker
                selected={date}
                onChange={(selectedDate) => setDate(selectedDate)}
                minDate={new Date()}
                excludeDates={unavailableDates}
                inline
              />

              {/* Time Slots */}
              <div className="slot-container mt-3">
                {timeSlots.map((slot) => {
                  const isBooked = bookedSlots.includes(slot);

                  return (
                    <button
                      key={slot}
                      disabled={isBooked}
                      className={`slot-btn ${
                        selectedSlot === slot ? "selected" : ""
                      } ${isBooked ? "booked" : ""} ms-2 mt-1`}
                      onClick={() => setSelectedSlot(slot)}
                    >
                      {formatSlotRange(slot)}
                      {isBooked && " (Unavailable)"}
                    </button>
                  );
                })}
              </div>

              <button
                className="btn btn-primary mt-3 w-100"
                onClick={handleBooking}
              >
                Confirm Booking
              </button>

              {bookingMessage && (
                <p className="mt-2">{bookingMessage}</p>
              )}
            </div>
          </div>

        </div>
      )}
    </div>
  );
}

export default BookService;
