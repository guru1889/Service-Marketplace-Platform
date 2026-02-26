import axios from "axios";
import React, { useEffect, useState } from "react";

function ProviderRegistration() {
  const [password, setPassword] = useState("");
  const [confirmpassword, setConfirmpassword] = useState("");
  const [ispending, setIspending] = useState(false);
  const [message, setMessage] = useState("");
  const [errors, setErrors] = useState({}); // 🔑 field errors
  const [category,setCategory]=useState([])
 useEffect(() => {
  axios.get('http://127.0.0.1:8000/categories')
    .then(res => {
      console.log("API RESPONSE:", res.data);
      setCategory(res.data);
    })
    .catch(err => console.log(err));
}, []);


  console.log(category)
  async function handleregister(e) {
    e.preventDefault();

    setMessage("");
    setErrors({});
    setIspending(true);

    // frontend password match check (UX only)
    if (password !== confirmpassword) {
      setErrors({ confirmpassword: ["Passwords do not match"] });
      setIspending(false);
      return;
    }

    try {
      const data = Object.fromEntries(new FormData(e.target));

      const res = await axios.post(
        "http://127.0.0.1:8000/providerRegister",
        data,{
        headers: {
      "Content-Type": "multipart/form-data",
      }},

      );

      setMessage(res.data.message || "Registration successful");
      e.target.reset();
      setPassword("");
      setConfirmpassword("");
    } catch (error) {
        if (error.response && typeof error.response.data === "object") {
          setErrors(error.response.data);   // ✅ THIS IS THE KEY FIX
        } else {
          setMessage("Server / Network error");
        }
      }

     finally {
      setIspending(false);
    }
  }

  return (
    <div className="row justify-content-center">
      <div className="col-sm-4">
        <form onSubmit={handleregister}>
          {/* Username */}
          <input
            type="text"
            name="username"
            placeholder="Enter username"
            className="form-control mt-2"
          />
          {errors.username && (
            <small className="text-danger">{errors.username[0]}</small>
          )}

          {/* Category */}
          <select name="category"className="form-select mt-2">
          <option value="">Select Category</option>

          {Array.isArray(category) &&
            category.map((data) => (
              <option key={data.id} value={data.id}>
                {data.category}
              </option>
            ))}
        </select>


          
          {errors.category && (
            <small className="text-danger">{errors.category[0]}</small>
          )}

          {/* Phone */}
          <input
            type="text"
            name="phone_number"
            placeholder="Phone number"
            className="form-control mt-2"
          />
          {errors.phone_number && (
            <small className="text-danger">{errors.phone_number[0]}</small>
          )}

          {/* Address */}
          <input
            type="text"
            name="address"
            placeholder="Address"
            className="form-control mt-2"
          />
          {errors.address && (
            <small className="text-danger">{errors.address[0]}</small>
          )}
          <label htmlFor="image">
            Upload profile image
          </label>
          <input type="file"  name="image" className="form-control mt-2" accept="image/*" />
          {/* Location */}
          <input
            type="text"
            name="location"
            placeholder="Service providing city"
            className="form-control mt-2"
          />
          {errors.location && (
            <small className="text-danger">{errors.location[0]}</small>
          )}

          {/* Salary */}
          <input
            type="text"
            name="salary"
            placeholder='Salary (optional)'
            className="form-control mt-2"
          />
          {errors.salary && (
            <small className="text-danger">{errors.salary[0]}</small>
          )}

          {/* Email */}
          <input
            type="email"
            name="email"
            placeholder="example@gmail.com"
            className="form-control mt-2"
          />
          {errors.email && (
            <small className="text-danger">{errors.email[0]}</small>
          )}

          {/* Password */}
          <input
            type="password"
            name="password"
            placeholder="Password"
            className="form-control mt-2"
            onChange={(e) => setPassword(e.target.value)}
          />
          {errors.password && (
            <small className="text-danger">{errors.password[0]}</small>
          )}

          {/* Confirm Password */}
          <input
            type="password"
            name="confirmpassword"
            placeholder="Confirm Password"
            className="form-control mt-2"
            onChange={(e) => setConfirmpassword(e.target.value)}
          />
          {errors.confirmpassword && (
            <small className="text-danger">
              {errors.confirmpassword[0]}
            </small>
          )}
          
          {/* Submit */}
          <button
            className="btn btn-primary mt-3 w-100"
            type="submit"
            disabled={ispending}
          >
            {ispending ? "Submitting..." : "Submit"}
          </button>
        </form>

        {/* Success / server message */}
        {message && <p className="text-success mt-2">{message}</p>}
      </div>
    </div>
  );
}

export default ProviderRegistration;
