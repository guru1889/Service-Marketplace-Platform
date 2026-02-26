import { NavLink } from "react-router-dom";
import profileicon from "./assets/person-circle.svg";
import { useAuth } from "./Auth_context";
function Nav() {
   
  


  const {  logout } = useAuth();
const auth = JSON.parse(localStorage.getItem("auth"));
  return (
    <nav className="navbar navbar-expand-lg bg-warning fixed-top">
      <div className="container-fluid">

        <span className="navbar-brand logo fw-bold">
          <span className="text-primary">HE</span>HIT
        </span>

        {/* Hamburger button */}
        <button
          className="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#mainNavbar"
        >
          <span className="navbar-toggler-icon"></span>
        </button>

        {/* Collapsible menu */}
        <div className="collapse navbar-collapse" id="mainNavbar">
          <ul className="navbar-nav ms-auto gap-3">
            <NavItem to="/">Home</NavItem>
            <NavItem to="/about_us">About us</NavItem>
            { !auth && (<>
            <NavItem to="/login">Login</NavItem>
            <NavItem to="/signup">Signup</NavItem>
            
            </> ) }
            {auth && auth.user.role === "customer" && (
                <>
                  <NavItem to="/dashboard">Dashboard</NavItem>
                  <NavItem to="/service">Service history</NavItem>
                </>
              )}

              {auth && auth.user.role === "service_provider" && (
                <>
                  <NavItem to="/providerdashboard">Dashboard</NavItem>
                  <NavItem to="/providerunavilable">Update Unavilability</NavItem>
                  
                </>
              )}
              {auth && auth.user.role?.toLowerCase() === "admin" && (
                  <>
                    <NavItem to="/admindashboard">Dashboard</NavItem>
                  </>
                )}
            
            <NavItem to="/profile">
              <img src={profileicon} alt="profile" width={30} />
            </NavItem>
          </ul>
        </div>

      </div>
    </nav>
  );
}

function NavItem({ to, children }) {
  return (
    <li className="nav-item">
      <NavLink
        to={to}
        className={({ isActive }) =>
          isActive ? "nav-link active" : "nav-link"
        }
      >
        {children}
      </NavLink>
    </li>
  );
}

export default Nav;
