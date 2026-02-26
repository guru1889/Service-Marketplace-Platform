import React from 'react';
import Nav from './Nav';
function AboutPage() {
  return (
    <div>
      <Nav/>
      <div className='container about'>
        <h2>About Hehit: Your Home, Handled.</h2>
        <p>Welcome to Hehit, where we turn home maintenance headaches into a thing of the past. Based right here in your community, we are your one-stop solution for professional, reliable, and "hit-the-mark" home services.</p>
        <h4>Who We Are</h4>
        <p>At Hehit, we believe that finding a trustworthy technician shouldn't be a chore. We started with a simple mission: to bridge the gap between local homeowners and skilled professionals. Whether it’s a flickering light or a leaky pipe, our system is designed to get the right expert to your doorstep, fast.</p>
        <h4>Why Choose Hehit?</h4>
        <p>We aren't just another directory; we are your local partners in home care.</p>
        <ul>
            <li><b>The "Hehit" Standard:</b> Every pro in our network is vetted for skill and punctuality.</li>
            <li><b>All-in-One Convenience:</b> No more calling five different people for five different problems.</li>
            <li><b>Local Heart, Professional Finish:</b> We live where you live, and we take pride in keeping our neighborhood running smoothly.</li>
        </ul>
        <h4>Our Core Services</h4>
        <p>Whatever your home needs, we've got the tools to fix it:</p>
        <ul>
            <li>⚡<b>Electricians:</b>  From full rewiring to installing that new smart fixture.</li>
            <li>🚰 <b>Plumbers:</b> Fixing leaks, clearing drains, and everything in between.</li>
            <li>❄️ <b>AC Mechanics:</b> Keeping you cool with expert repairs and seasonal servicing.</li>
            <li>🎨 <b>Painters: </b>Giving your space a fresh, vibrant new look.</li>
            <li>🛠️ <b>And More:</b> Our system is constantly growing to include carpentry, cleaning, and general repairs.</li>
        </ul>
        <h4>Our Promise</h4>
        <p>When you call Hehit, you aren't just getting a service; you're getting peace of mind. We show up on time, respect your home, and don't leave until the job is done right.</p>

      </div>
    </div>
  );
}

export default AboutPage;
