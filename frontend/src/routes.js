import { Route, Routes } from "react-router"
import {IndexView} from "./views/IndexView"

export const _ROUTES = _ => {
    return (
        <Routes>
            <Route path="/" element={<IndexView/>}/>
        </Routes>
    )
}