import React from "react";
import { Link } from "react-router-dom";
const Navigation: React.FC = () => {
  return (
    <>
      <ul>
        <li>
          <Link to="/">Homepage</Link>
        </li>
        <li>
          <Link to="/animals">Animals</Link>
        </li>
        <li>
          <Link to="/customers">Customers</Link>
        </li>
        <li>
          <button onClick={() => window.location.reload()}>Reload</button>
        </li>
      </ul>
      <hr></hr>
    </>
  );
};
export default Navigation;
