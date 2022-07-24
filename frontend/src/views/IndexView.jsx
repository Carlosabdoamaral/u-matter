import { technologies, text_banner, text_who, workers_list } from "../utils/data"

const IndexView = _ => {
    return (
        <main className="index-view">
            <div className="banner" id="banner">
                <h2>{text_banner.title}</h2>
                <p>{text_banner.subtitle}</p>
                <button>{text_banner.btn}</button>
            </div>

            <div className="who" id="who">
                <h2>{text_who.title}</h2>
                <p>{text_who.subtitle}</p>
                <div className="squad">
                    {
                        workers_list.map((worker, i) => (
                            <div className="worker_card">
                                <img src={worker.image} alt="" />
                                <div>
                                    <small>{worker.job}</small>
                                    <h4>{worker.name.short}</h4>
                                </div>
                            </div>
                        ))
                    }
                </div>
            </div>

            <div className="tech" id="tech">
                <h2>Tecnologias <span>que usamos</span></h2>
                <div className="cells">
                {
                    technologies.map((tech, i) => (
                        <div className="tech-cell">
                            <a href={tech.doc}>{tech.name}</a>
                        </div>
                    ))
                }
                </div>
            </div>
        </main>
    )
}

export { IndexView }