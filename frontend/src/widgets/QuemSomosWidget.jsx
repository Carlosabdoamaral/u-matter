import { teamData } from "../static/data/team"

export const QuemSomosWidget = _ => {
    return (
        <div className="quemSomos">

            <h1>Quem Somos?</h1>

            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dictum sem sapien, eu
                feugiat turpis congue rhoncus. Vivamus elit nulla, ullamcorper nec ullamcorper et,
                fermentum sed lectus. Nullam ornare nisi eros, tempus faucibus diam bibendum sit amet.
                Donec nunc sapien, porttitor et condimentum id, tincidunt in purus. Mauris dictum id
                purus cursus laoreet. Nunc posuere libero vitae consectetur vehicula. Aliquam fringilla
                mattis hendrerit. Donec mollis tortor eu tincidunt molestie. Proin finibus velit pulvinar
                dui auctor vestibulum. Vivamus quis mi id magna lacinia egestas. Donec imperdiet id augue
                non sodales. Vestibulum ac luctus
            </p>

            <div className="container">

                {teamData.map((obj, i) => (
                    <div className="card">
                        <img src={obj.image} alt= {`Imagem ${obj.area} ${obj.name}`} />
                        <span>{obj.area}</span>
                        <h2>{obj.name}</h2>
                    </div>
                ))}

            </div>
        </div>
    )
}