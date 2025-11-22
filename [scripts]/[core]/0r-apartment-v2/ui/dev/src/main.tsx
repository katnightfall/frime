import ReactDOM from "react-dom/client";
import App from "@/components/App";
import { VisibilityProvider } from "@/providers/VisibilityProvider";
import RouterProvider from "@/providers/RouterProvider";
import { DataProvider } from "@/providers/DataProvider";
import "./index.css";
import "@/services/i18n";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <>
    <DataProvider>
      <VisibilityProvider>
        <RouterProvider>
          <App />
        </RouterProvider>
      </VisibilityProvider>
    </DataProvider>
  </>
);
