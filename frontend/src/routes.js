import { Route, Routes } from "react-router-dom"
import IndexView from "./views/IndexView"

export default function URLS() {
    return (
        <Routes>
            <Route path="/" element={<IndexView/>}/>
        </Routes>
    )
}