import "../static/scss/IndexView.scss"
import "../static/scss/ResponsiveQuemSomos.scss"
import { QuemSomosWidget } from "../widgets/QuemSomosWidget";
import { BannerWidget } from "../widgets/BannerWidget";

export default function IndexView() {
    return (
        <main>
            <QuemSomosWidget/>
            <BannerWidget/>
        </main>
    )
}