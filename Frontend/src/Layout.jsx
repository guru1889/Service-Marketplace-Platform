import Nav from "./Nav";
import { Outlet } from "react-router-dom";

function Layout() {
  return (
    <>
      <Nav />
      <div style={{ marginTop: "100px" }}>
        <Outlet />
      </div>
    </>
  );
}

export default Layout;
