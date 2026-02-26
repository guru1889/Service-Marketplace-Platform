import { useNavigate } from "react-router-dom";
function AdminSideBar() {
  const navigate = useNavigate();

  return (
    <div className="p-5 card " style={{height:'80vh'}}>
      <div className="cursor" onClick={() => navigate("stats")}>
        <p>Dashboard</p>
      </div>

      <div
        className="cursor"
        onClick={() => navigate("providerapproval")}
      >
        <p>Provider Verification</p>
      </div>
    </div>
  );
}
export default AdminSideBar