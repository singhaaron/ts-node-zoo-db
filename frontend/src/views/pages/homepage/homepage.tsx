import React from "react"; // we need this to make JSX compile

type Homepage_Props = {
  title: string;
};

const Homepage = ({ title }: Homepage_Props) => {
  return (
    <>
      <h2>Zoo Node Database</h2>
    </>
  );
};

export default Homepage;
