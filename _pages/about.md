---
permalink: /
title: "Hello"
---

<style>
  .about-highlights {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 1rem;
    margin: 1.5rem 0;
  }

  .about-highlight-card {
    position: relative;
    display: block;
    overflow: hidden;
    border-radius: 0.35rem;
    background: rgba(255, 255, 255, 0.04);
  }

  .about-highlight-card img {
    display: block;
    width: 100%;
    aspect-ratio: 1 / 1;
    object-fit: cover;
    transition: transform 180ms ease;
  }

  .about-highlight-card::after {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(to top, rgba(10, 10, 10, 0.96), rgba(10, 10, 10, 0.28) 60%);
    opacity: 0;
    transition: opacity 180ms ease;
  }

  .about-highlight-card__meta {
    position: absolute;
    inset: auto 0 0 0;
    z-index: 1;
    padding: 1.55rem 0.9rem 0.5rem;
    color: #fff;
    opacity: 0;
    transition: opacity 180ms ease;
  }

  .about-highlight-card__title {
    margin: 0 0 0.35rem;
    font-size: 0.74rem;
    line-height: 1.3;
  }

  .about-highlight-card__journal {
    margin: 0;
    font-size: 0.74rem;
    opacity: 0.9;
  }

  .about-highlight-card:hover img,
  .about-highlight-card:focus-visible img {
    transform: scale(1.03);
  }

  .about-highlight-card:hover::after,
  .about-highlight-card:focus-visible::after,
  .about-highlight-card:hover .about-highlight-card__meta,
  .about-highlight-card:focus-visible .about-highlight-card__meta {
    opacity: 1;
  }

  @media (max-width: 720px) {
    .about-highlights {
      grid-template-columns: 1fr;
    }
  }
</style>

I am a postdoctoral researcher in the <a href="https://www.iddo.org">Infectious 
Diseases Data Observatory</a> (IDDO), at the University of Oxford. As part of 
the <a href="https://www.iddo.org/wwarn">Worldwide Antimalarial Resistance 
Network</a> (WWARN), and in collaboration with the <a href="https://www.marcse-africa.org">Mitigating Antimalarial 
Resistance Consortium in South-East Africa</a> (MARC SE-Africa),
I am constructing geospatial models of molecular markers for antimalarial drug 
resistance in <i>Plasmodium falciparum</i> malaria in Africa.

<div class="about-highlights">
  <a class="about-highlight-card" href="https://doi.org/10.64898/2026.03.03.26347488">
    <img src="/assets/images/policy_k13.png" alt="Thumbnail for artemisinin resistance preprint">
    <div class="about-highlight-card__meta">
      <h3 class="about-highlight-card__title">Estimating the changing prevalence of molecular markers of artemisinin partial resistance in <i>Plasmodium falciparum</i> malaria in Sub-Saharan Africa</h3>
      <p class="about-highlight-card__journal"><i>MedRxiv</i></p>
    </div>
  </a>

  <a class="about-highlight-card" href="https://doi.org/10.1098/rsos.230641">
    <img src="/assets/images/2024multicriteria.svg" alt="Thumbnail for multi-criteria surveillance paper">
    <div class="about-highlight-card__meta">
      <h3 class="about-highlight-card__title">A multi-criteria framework for disease surveillance site selection: case study for <i>Plasmodium knowlesi</i> malaria in Indonesia</h3>
      <p class="about-highlight-card__journal"><i>Royal Society Open Science</i></p>
    </div>
  </a>

  <a class="about-highlight-card" href="https://doi.org/10.1371/journal.pntd.0014127">
    <img src="/assets/images/jev_birds_vectors.tif" alt="Thumbnail for Japanese encephalitis habitat suitability paper">
    <div class="about-highlight-card__meta">
      <h3 class="about-highlight-card__title">A time-varying geospatial model of habitat suitability for Japanese encephalitis virus vectors and vertebrate hosts in Australia</h3>
      <p class="about-highlight-card__journal"><i>PLOS Neglected Tropical Diseases</i></p>
    </div>
  </a>
</div>

Until 2024, I was a PhD student in the School of Maths and Stats at 
the University of Melbourne, in the <a href="https://mathematical-biology.science.unimelb.edu.au">Melbourne 
Mathematical Biology</a> Group. My thesis explored structured decision-making 
using geospatial modelling outputs. During my PhD, I applied methods of 
structured decision-making to models of <i>Plasmodium knowlesi</i> malaria in 
Indonesia, antimalarial resistance in <i>Plasmodium falciparum</i> in India 
and Japanese encephalitis virus in Australia.

If you're interested in having a chat, please contact me at lucy.harrison.research (at) gmail.com
