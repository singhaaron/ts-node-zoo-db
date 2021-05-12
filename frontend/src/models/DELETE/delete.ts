const DELETE_CUSTOMER = async (table: any) => {
  //Request Body & Header Configuration
  const headers = {
    method: "DELETE",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify(table),
  };
  const response: any = await fetch(`http://localhost:5050/db_customers`, headers);
  return response;
};

//Module Export
const _ = {
  DELETE_CUSTOMER,
};
export default _;
