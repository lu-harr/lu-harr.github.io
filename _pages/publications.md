---
permalink: /publications/
title: Publications
toc: true
gallery:
  - url: /assets/images/mim_poster_2023.jpeg
    image_path: /assets/images/mim_poster_2023.jpeg
    alt: "placeholder image 1"
    title: "Malaria in Melbourne 2023: Multi-objective decision framework"
  - url: /assets/images/smb_poster_2022.jpeg
    image_path: /assets/images/smb_poster_2022.jpeg
    alt: "placeholder image 2"
    title: "ECMTB 2022: Multi-criteria decision framework"
---

<style>
  .highlights-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 1rem;
    margin: 1.5rem 0 2rem;
  }

  .highlight-card {
    position: relative;
    display: block;
    overflow: hidden;
    border-radius: 0.85rem;
    background: rgba(255, 255, 255, 0.04);
  }

  .highlight-card img {
    display: block;
    width: 100%;
    aspect-ratio: 4 / 5;
    object-fit: cover;
    transition: transform 180ms ease;
  }

  .highlight-card::after {
    content: "";
    position: absolute;
    inset: 0;
    background: linear-gradient(to top, rgba(10, 10, 10, 0.88), rgba(10, 10, 10, 0.08) 60%);
    opacity: 0;
    transition: opacity 180ms ease;
  }

  .highlight-card__meta {
    position: absolute;
    inset: auto 0 0 0;
    z-index: 1;
    padding: 1rem;
    color: #fff;
    opacity: 0;
    transform: translateY(8px);
    transition: opacity 180ms ease, transform 180ms ease;
  }

  .highlight-card__title {
    margin: 0 0 0.35rem;
    font-size: 1rem;
    line-height: 1.3;
  }

  .highlight-card__journal {
    margin: 0;
    font-size: 0.9rem;
    opacity: 0.9;
  }

  .highlight-card:hover img,
  .highlight-card:focus-visible img {
    transform: scale(1.03);
  }

  .highlight-card:hover::after,
  .highlight-card:focus-visible::after,
  .highlight-card:hover .highlight-card__meta,
  .highlight-card:focus-visible .highlight-card__meta {
    opacity: 1;
  }

  .highlight-card:hover .highlight-card__meta,
  .highlight-card:focus-visible .highlight-card__meta {
    transform: translateY(0);
  }

  @media (max-width: 720px) {
    .highlights-grid {
      grid-template-columns: 1fr;
    }
  }
</style>

## Highlights

<div class="highlights-grid">
  <a class="highlight-card" href="https://doi.org/10.64898/2026.03.03.26347488">
    <img src="/assets/images/policy_k13.png" alt="Thumbnail for artemisinin resistance preprint">
    <div class="highlight-card__meta">
      <h3 class="highlight-card__title">Estimating the changing prevalence of molecular markers of artemisinin partial resistance in <i>Plasmodium falciparum</i> malaria in Sub-Saharan Africa</h3>
      <p class="highlight-card__journal"><i>MedRxiv</i></p>
    </div>
  </a>

  <a class="highlight-card" href="https://doi.org/10.1098/rsos.230641">
    <img src="/assets/images/2024multicriteria.jpg" alt="Thumbnail for multi-criteria surveillance paper">
    <div class="highlight-card__meta">
      <h3 class="highlight-card__title">A multi-criteria framework for disease surveillance site selection: case study for <i>Plasmodium knowlesi</i> malaria in Indonesia</h3>
      <p class="highlight-card__journal"><i>Royal Society Open Science</i></p>
    </div>
  </a>

  <a class="highlight-card" href="https://doi.org/10.1371/journal.pntd.0014127">
    <img src="/assets/images/jev_birds_vectors.tif" alt="Thumbnail for Japanese encephalitis habitat suitability paper">
    <div class="highlight-card__meta">
      <h3 class="highlight-card__title">A time-varying geospatial model of habitat suitability for Japanese encephalitis virus vectors and vertebrate hosts in Australia</h3>
      <p class="highlight-card__journal"><i>PLOS Neglected Tropical Diseases</i></p>
    </div>
  </a>
</div>

## First author papers

- <a href="https://doi.org/10.64898/2026.03.03.26347488">Estimating the changing prevalence of molecular markers of artemisinin partial resistance in *Plasmodium falciparum* malaria in Sub-Saharan Africa</a> (*preprint*) \
**Lucinda E Harrison**, Nick Golding, Tianxiao Hao, Imke Botha, Stephanie van Wyk, Donnie Mategula, Prabin Dahal, Jaishree Raman, Daniel J Weiss, Karen I Barnes, Philippe J Guérin, and Jennifer A Flegg. (2026). *MedRxiv*.  

- <a href="https://doi.org/10.1371/journal.pgph.0004717">Model-based geospatial surveillance system for antimalarial drug resistance</a>  \
Apoorv Gupta\*, **Lucinda E. Harrison**\*, Minu Nain, Sauman Singh-Phulgenda, Rutuja Chhajed, Roopal S kumar, Aishika Das, Manju Rahi, Philippe J. Guerin, Anup R Anvikar, Mehul Dhorda, Jennifer A. Flegg, and Praveen K. Bharti. (2026). *PLOS Global Public Health*  \
See <a href="https://iddo.shinyapps.io/pf_drug_resistance/">companion RShiny app</a>.

- <a href="https://doi.org/10.1098/rsos.230641">A multi-criteria framework for disease surveillance site selection: case study for *Plasmodium knowlesi* malaria in Indonesia</a>  \
**Lucinda E. Harrison**, Jennifer A. Flegg, Ruarai Tobin, Inke N. D. Lubis, Rintis Noviyanti, Matthew J. Grigg, Freya M. Shearer and David J. Price. (2024). *Royal Society Open Science*.  \
Have a play with the companion Shiny app <a href="http://lucyharrison.shinyapps.io/pk_multicrit_shiny/">here</a>.

\* Contributed equally

## Other papers

- <a href="https://doi.org/10.1371/journal.pntd.0014127">A time-varying geospatial model of habitat suitability for Japanese encephalitis virus vectors and vertebrate hosts in Australia</a> (2026) \
David H. Duncan, **Lucinda Harrison**, Abbey Potter, Craig Brockway, Kimberly Evasco, Stephen Doggett, Rebecca Feldman, Peter Neville, Andrew van den Hurk, Cassie Jansen, Michaela Hobby, Vicky Burns, Andrew Vickers, Nina Kurucz, Nick Golding, and Freya Shearer. *PLOS Neglected Tropical Diseases*.

- <a href="https://doi.org/10.1371/journal.pntd.0011570">Updating estimates of *Plasmodium knowlesi* malaria risk in response to changing land use patterns across Southeast Asia</a> (2024)  \
Ruarai J. Tobin, **Lucinda E. Harrison**, Meg K. Tully, Inke N. D. Lubis, Rintis Noviyanti, Nicholas M. Anstey, Giri S. Rajahram, Matthew J. Grigg, Jennifer A. Flegg, David J. Price, and Freya M. Shearer. *PLOS Neglected Tropical Diseases*.
          
- <a href="https://doi.org/10.4269/ajtmh.23-0631">Systematic Review 
and Geospatial Modeling of Molecular Markers of Resistance to Artemisinins 
and Sulfadoxine-Pyrimethamine in *Plasmodium falciparum* in India</a> (2024) \
M Nain, M Dhorda, J. A. Flegg, A. Gupta, **L. E. Harrison**, S. Singh-Phulgenda , S. D. Otienoburu, E. Harriss, P. K. Bharti, B. Behera, M. Rahi, P. J. Guerin, and A Sharma. *The American Journal of Tropical Medicine and Hygiene*.
        
- <a href="https://doi.org/10.1136%2Fbmjno-2023-000407">Modelling 
accessibility of adult neurology care in Australia, 2020–2034</a> (2023)  \
Steve Simpson-Yap, Federico Frascoli, **Lucinda Harrison**, Charles Malpas, James Burrell, Nicholas Child, Lauren P Giles, Christian Lueck, Merrilee Needham, Benjamin Tsang, and Tomas Kalincik. *BMJ Neurology Open*.

## Presentations and posters

{% include gallery %}

## Reports to Government

- *Mapping Japanese encephalitis infection risk in Australia to inform public health response*\* (2022)  \
  **Lucinda E. Harrison**, David H. Duncan, Jennifer A. Flegg, David J. Price, 
  James M. McCaw, Nick Golding and Freya M. Shearer. Report to Australian 
  Goverment Department of Health and Aged Care.
  
- *Mapping Japanese encephalitis infection risk in Australia*\* (2023)  \
  David H. Duncan, **Lucinda E. Harrison**, Domenic P. J. Germano, Jennifer
  A. Flegg, David J. Price, James M. McCaw, Nick Golding, Freya M. Shearer.
  Report to Australian Government Department of Health and Aged Care.

\* Not published in the public domain
      
## Manuscripts in prep.

- *Geospatial assessment of Japanese encephalitis virus infection risk in Australia* (LH first author)  \
A description of models of potential and realised niche of Japanese encephalitis virus, drawing on pathogen surveillance data; first described in reports to government.  \
With David Duncan, Freya Shearer, Nick Golding, Jennifer Flegg, David Price, Domenic Germano and others.
  
- *Using geospatial models to select primary healthcare centres for surveillance of <i>Plasmodium knowlesi</i> malaria* (LH first author)  \
Disease surveillance produces critical information on disease prevalence, incidence and clinical outcomes, however it is limited by available resources and should be carefully planned. The spatial distribution of risk of <i>Plasmodium knowlesi</i> malaria in north-western Indonesia is not well understood. However, numerous studies have linked disease risk to environments where humans, macaque hosts and mosquito vectors interact, on the forest fringe and in croplands and plantations. We present a flexible framework for the selection of primary healthcare centres for targeted disease surveillance, applied to the surveillance of <i>P. knowlesi</i> malaria in north-western Indonesia. We consider several definitions of healthcare centre catchment area, and explore a number of possible objectives for disease surveillance, incorporating the outputs of a geospatial model of disease risk. These objectives can be optimised for individual sites or complete surveillance designs, and can be optimised independently or simultaneously, in a multi-objective decision problem.  \
With Jennifer Flegg, Freya Shearer, David Price, Matthew Grigg, Inke Lubis, Rintis Noviyanti and others.
  
- *Appraisal and iterative selection of sites for surveillance of Japanese encephalitis virus in mosquitoes* (LH first author)  \
A framework for the iterative identification of candidate optimal designs for 
Japanese encephalitis virus in mosquitoes, drawing on the outputs described in 
reports to government.  \
With Freya Shearer, Jennifer Flegg, David Price, David Duncan, Nick Golding and others.
  
- *Gender representation at mathematics conferences in Australia: all a matter of perception?*  \
We all seek to improve gender representation in mathematics academia, but do we all share the same understanding of the current state of affairs? Are there biases unique to each of us that change our individual perception of gender representation? Anecdotal evidence suggests gender and age shape an individual's perception of gender representation and therefore their commitment to the advancement of gender equality, however a quantitative dataset for the Australian mathematics community does not exist. With the support of local mathematics and statistics societies, we aim to evaluate the current state of gender representation at mathematics and statistics conferences.  \
With Adriana Zanca, Isobel Abell, Punya Alahakoon, Jennifer Flegg and others.
