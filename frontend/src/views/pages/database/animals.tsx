import React, { useEffect, useState } from "react";
import * as API from "../../../models/GET/Get";

const Animals = () => {
  const [dbResults, setdbResults] = useState<any>(null);
  useEffect(() => {
    API.default.GET_ANIMALS(setdbResults);
  }, []);

  const listItems =
    dbResults == null ? (
      <li>Loading Data</li>
    ) : (
      dbResults.map((data: any, index: any) => (
        <div key={index}>
          <hr></hr>
          <ul>
            <li> Animal Type: {data.type}</li>
            <li> Animal Name: {data.name}</li>
            <li> Exhibit Name: {data.Exhibit_Name}</li>
            <li> Physical Location : {data.location}</li>
            <li> Climate: {data.climate}</li>
          </ul>
          <hr></hr>
        </div>
      ))
    );
  return (
    <div>
      <h3>Animal In Exhibits</h3>
      {listItems}
    </div>
  );
};

export default Animals;
