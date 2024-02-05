import React from "react";

type HelloProps = {
  name: string;
};

export default function ReactHello(props: HelloProps) {
  const name = props.name;
  return (
    <section className="phx-hero">
      <h1>Say Hello to {name} with TypeScript and React!</h1>
      <p>We are ready to go!</p>
    </section>
  );
}
