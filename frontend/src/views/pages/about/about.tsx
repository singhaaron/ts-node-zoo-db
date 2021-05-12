import React from "react"; // we need this to make JSX compile

type AboutProps = {
  name: string;
  description: string;
};

const About = ({ name, description }: AboutProps) => (
  <>
    <h2>{name}</h2>
    <p>{description}</p>
  </>
);

const about = <About name="Aaron" description="My name is Aaron" />;
export default about;
