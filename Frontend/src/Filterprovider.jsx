import { useEffect, useState } from "react";
import api from './api';
function Filterprovider({ allProviders = [], setProviders }) {

  const [location, setLocation] = useState('');
  const [categories, setCategories] = useState([]);
  useEffect(() => {
  api.get('/categories')
    .then(res => {
      console.log("Categories:", res.data);
      setCategories(res.data);
    })
    .catch(err => console.log(err));
}, []);



  function search() {

  if (location.trim() === "") {
    setProviders(allProviders);  // reset full list
    return;
  }

  const filteredData = allProviders.filter((data) =>
    data.location
      ?.toLowerCase()
      .includes(location.toLowerCase().trim())
  );

  setProviders(filteredData);
}

  function categoryfilter(e) {
    const selectedValue = e.target.value;

    if (selectedValue === "") {
      setProviders(allProviders);
      return;
    }

    const filteredData = allProviders.filter(
      (data) => data.service === selectedValue
    );

    setProviders(filteredData);
  }

  return (
    <div className='filter p-2 bg-warning d-flex justify-content-between '>
      <div className='btn-group'>
        <input
          type="text"
          value={location}
          onChange={(e) => setLocation(e.target.value)}
          placeholder="Enter the location"
        />

        <button className="btn btn-dark" onClick={search}>
          🔍
        </button>
      </div>

      <select onChange={categoryfilter}>
        <option value="">Choose Service Category</option>

        {categories.map((data, index) => (
          <option key={index} value={data.category}>
            {data.category}
          </option>
        ))}

      </select>

    </div>
  );
}

export default Filterprovider;