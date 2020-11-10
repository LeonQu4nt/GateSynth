<!-- PROJECT LOGO -->
<br />
<p align="center">

  <h3 align="center">GateSynth</h3>

  <p align="center">
    A gate decomposing software for quantum computing.
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

There are many great README templates available on GitHub, however, I didn't find one that really suit my needs so I created this enhanced one. I want to create a README template so amazing that it'll be the last one you ever need.

Here's why:
* Your time should be focused on creating something amazing. A project that solves a problem and helps others
* You shouldn't be doing the same tasks over and over like creating a README from scratch
* You should element DRY principles to the rest of your life :smile:

Of course, no one template will serve all projects since your needs may be different. So I'll be adding more in the near future. You may also suggest changes by forking this repo and creating a pull request or opening an issue.

A list of commonly used resources that I find helpful are listed in the acknowledgements.

<!-- GETTING STARTED -->
### Prerequisites

This project is written in MATLAB R2020b, which must be installed on the local machine in order to execute the code. This is available at [MATLAB](https://uk.mathworks.com/products/get-matlab.html?s_tid=gn_getml).

### Installation

Run the following command in order to clone the repo to the desired location.
```sh
git clone https://github.com/LeonQu4nt/GateSynth.git
```

Alternatively, download the scripts directly and store in a shared folder.

<!-- USAGE EXAMPLES -->
## Usage

Store the list of 3 qubit unitaries that need to be decomposed in an array with 3 indeces, using the third index to distinguish them. This should then be an 8x8xN array, where N is the number of unitaries to be decomposed. Run the following command to execute the decomposition:
```
% The array is stored in variable U. The circuit is retrieved in string format in variable str.
str = decompose(U);
```

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- CONTACT -->
## Contact

Sebastian Leontica - sebastian.leontica@spc.ox.ac.uk

Project Link: [https://github.com/LeonQu4nt/GateSynth](https://github.com/LeonQu4nt/GateSynth)
