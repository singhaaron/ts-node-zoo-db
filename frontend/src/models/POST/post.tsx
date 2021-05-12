const POST_CUSTOMER = async (table: any) => {
  //Request Body & Header Configuration
  const headers = {
    method: "POST",
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
  POST_CUSTOMER,
};
export default _;
