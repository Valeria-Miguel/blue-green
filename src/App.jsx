import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  return (
    <div style={{
      minHeight: "100vh",
      background: "#ff006e",
      padding: "3rem",
      color: "white",
      fontFamily: "Arial",
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      textAlign: "center"
    }}>
      
      <h1 style={{ fontSize: "3rem", marginBottom: "1rem" }}>
        Blue-Green Deployment
      </h1>
      <h1 style={{ fontSize: "3.5rem" }}>
  GREEN DESPLEGADO AUTOMÁTICAMENTE
</h1>

      <p style={{ fontSize: "1.4rem", maxWidth: "800px" }}>
        Estrategia de despliegue que permite actualizar aplicaciones sin tiempo de inactividad (zero-downtime),
        utilizando dos entornos paralelos: <b>Blue</b> y <b>Green</b>.
      </p>

      <div style={{
        marginTop: "3rem",
        background: "#2a9d8f",
        padding: "2rem",
        borderRadius: "12px",
        width: "80%",
        maxWidth: "700px",
        boxShadow: "0 5px 15px rgba(0,0,0,0.3)"
      }}>
        <h2 style={{ marginBottom: "1rem" }}>Entorno Activo</h2>
        <p style={{ fontSize: "1.2rem", fontWeight: "bold" }}>
          Versión actual: <span style={{ color: "#e9c46a" }}>Blue-Green Deployment Activo</span>
        </p>
      </div>

    </div>
  );
}

export default App;

