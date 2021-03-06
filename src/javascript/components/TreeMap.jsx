import React, { useRef, useEffect } from "react";

import { treemap } from "../functions";

const TreeMap = ({
  fileClickCallback,
  values,
  filePrefix,
  displayRegression,
  regressionType,
  metricType,
  displayFilenames,
  path,
  activeFile
}) => {
  const canvas = useRef(null);

  useEffect(() => {
    treemap(
      canvas.current,
      {
        values,
        displayRegression,
        regressionType,
        metricType,
        displayFilenames,
        filePrefix,
        path,
        activeFile
      },
      fileClickCallback
    );
  });
  return <div id="canvas" ref={canvas}></div>;
};

export default TreeMap;
