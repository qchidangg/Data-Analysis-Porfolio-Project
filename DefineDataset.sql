select *
from PROJECT..CovidDeaths$
order by 3,4

--select *
--from PROJECT..CovidVaccinations$
--order by 3,4

--Select Data that we are going to be using

Select Location,date,total_cases,new_cases,total_deaths,population
from PROJECT..CovidDeaths$
order by 1,2

-- Looking at Total cases vs Total deaths
-- Show likelihood of dying if you contrat convid in your country

Select Location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
From PROJECT..CovidDeaths$
Where Location like '%states%'
order by 1,2

-- Looking at Total cases vs Total deaths
-- Show what percentage of population got Covid

Select Location,date,total_cases,total_deaths,(total_cases/population)*100 as DeathPercentage
From PROJECT..CovidDeaths$
Where Location like '%states%'
order by 1,2

-- Looking at Countries with highest Infections Rate compared to population
Select Location, Population,Max(Total_cases) as HighestInfectionCount,Max((total_cases/population))*100 as PercentPopulationInfected
From PROJECT..CovidDeaths$
Group by Location,Population
order by PercentPopulationInfected desc

