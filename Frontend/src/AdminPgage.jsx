import React from 'react';
import ProviderApproval from './ProviderApproval';
import Stats from './Stats';
import AdminSideBar from './AdminSideBar';
import { Outlet } from 'react-router-dom';
function AdminPgage() {
  return (
      <div className="container-fluid">
        <div className="row">
          
          {/* Sidebar */}
          <div className="col-12 col-md-3 ">
            <AdminSideBar />
          </div>

          {/* Content */}
          <div className="col-12 col-md-9 p-4">
            <Outlet />
          </div>

        </div>
      </div>
);
}

export default AdminPgage;
