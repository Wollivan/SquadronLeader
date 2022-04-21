import React from "react";
import "./Printing.scss";
import AssetsZip from "../../assets/printing/aeronuats-assets.zip";
import SCADFiles from "../../assets/printing/OpenSCAD/aeronauts-scad.zip";
import STLFiles from "../../assets/printing/STLs/aeronauts-STLs.zip";
import SCADImage from "../../assets/images/printing-assets.png";

export default function Printing() {
  return (
    <div className="content" id="downloads">
      <div className="printing">
        <h2>Downloads</h2>
        <ul className="printing__list">
          <li className="printing__list-item">
            <a className="printing__download" href={AssetsZip}>
              Download all printing assets
            </a>
          </li>
          <li className="printing__list-item">
            <a className="printing__download" href={SCADFiles}>
              Download OpenSCAD
            </a>
          </li>
          <li className="printing__list-item">
            <a className="printing__download" href={STLFiles}>
              Download printable STLs
            </a>
          </li>
        </ul>
        {/* <img
          className="printing__assets-img"
          src={SCADImage}
          alt="SCAD assets"
        /> */}
      </div>
    </div>
  );
}
