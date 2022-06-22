import "../static/scss/IndexView.scss"
import { BannerWidget } from "../widgets/BannerWidget";
import { QuemSomosWidget } from "../widgets/QuemSomosWidget"

export default function IndexView() {
    return (
        <main>
            
            <BannerWidget/>

            <QuemSomosWidget/>
        </main>
    )
}