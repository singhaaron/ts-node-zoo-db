import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import Homepage from "./views/pages/homepage/homepage";
import AnimalExhibitViews from "./views/pages/database/animals";
import Customers from "./views/pages/database/customers";
import Navigation from "./views/pages/global/nav";

//React Main FC
const App = () => {
  return (
    <>
      <BrowserRouter>
        <Navigation />
        <Switch>
          <Route path="/" exact component={Homepage} />
          <Route path="/animals" exact component={AnimalExhibitViews} />
          <Route path="/customers" exact component={Customers} />
        </Switch>
      </BrowserRouter>
    </>
  );
};

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById("root")
);
