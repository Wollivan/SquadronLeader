import { React, useEffect, useState } from "react";
import Markdown from "markdown-to-jsx";
import "./Instructions.scss";
import SCADImage from "../../assets/images/gameplay.jpg";

export default function Instructions() {
  const [post, setPost] = useState("");

  useEffect(() => {
    import("../../assets/markdown/README.md")
      .then((res) => {
        fetch(res.default)
          .then((res) => res.text())
          .then((res) => setPost(res))
          .catch((err) => console.log(err));
      })
      .catch((err) => console.log(err));
  });

  return (
    <div className="content">
      <div className="rules">
        <Markdown>{post}</Markdown>
      </div>
      {/* <img className="printing__assets-img" src={SCADImage} alt="SCAD assets" /> */}
    </div>
  );
}
