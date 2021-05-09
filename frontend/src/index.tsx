import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom";
import GlobalStyle from "./views/css/global";
import styled from "styled-components";

//API
import * as API from "./models/GET/Get";
//Styled Components
const Container = styled.div`
  color: black;
  background-color: white;
`;
//React Main FC
const App = () => {
  useEffect(() => {
    API.default.API_ANIMAL_EXHIBIT(setdbResults);
  }, []);
  const [dbResults, setdbResults] = useState<any>(null);
  const listItems =
    dbResults == null ? (
      <li>Loading Data</li>
    ) : (
      dbResults.map((data: any) => (
        <Container>
          <hr></hr>
          <ul>
            <li> Animal Type: {data.type}</li>
            <li> Animal : {data.name}</li>
            <li> Exhibit Name : {data.Exhibit_Name}</li>
            <li> Physical Location : {data.location}</li>
            <li> Climate : {data.climate}</li>
          </ul>
          <hr></hr>
        </Container>
      ))
    );
  return (
    <>
      <GlobalStyle />
      {listItems}
    </>
  );
};

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById("root")
);
