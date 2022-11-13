-- ex1

select sum(SalesAmount), OrderDateKey
from FactInternetSales
group by OrderDateKey
order by OrderDateKey;

with sumByDate as (select sum(SalesAmount) as sum, OrderDateKey
                   from FactInternetSales
                   group by OrderDateKey)

select sum(sumByDate.sum) over (order by OrderDateKey rows between 2 preceding and current row) as sum, OrderDateKey
from sumByDate;

-- ex2

select month(OrderDate)           as month_of_year,
       coalesce(sum(pvt.[0]), 0)  as [0],
       coalesce(sum(pvt.[1]), 0)  as [1],
       coalesce(sum(pvt.[2]), 0)  as [2],
       coalesce(sum(pvt.[3]), 0)  as [3],
       coalesce(sum(pvt.[4]), 0)  as [4],
       coalesce(sum(pvt.[5]), 0)  as [5],
       coalesce(sum(pvt.[6]), 0)  as [6],
       coalesce(sum(pvt.[7]), 0)  as [7],
       coalesce(sum(pvt.[8]), 0)  as [8],
       coalesce(sum(pvt.[9]), 0)  as [9],
       coalesce(sum(pvt.[10]), 0) as [10]
from FactInternetSales pivot
         (
         sum(SalesAmount)
         for SalesTerritoryKey in
        ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10])
         ) as pvt
where year(OrderDate) = 2011
group by month(OrderDate)
order by month_of_year;

-- ex3

select *
from (select null as 'OrganizationKey', null as 'DepartmentGroupKey', sum(Amount) as amount
      from FactFinance
      union
      select OrganizationKey as 'OrganizationKey', null as 'DepartmentGroupKey', sum(Amount) as amount
      from FactFinance
      group by OrganizationKey
      union
      select OrganizationKey as 'OrganizationKey', DepartmentGroupKey as 'DepartmentGroupKey', sum(Amount) as amount
      from FactFinance
      group by OrganizationKey, DepartmentGroupKey) t
order by OrganizationKey, case when DepartmentGroupKey is null then 999999999 else DepartmentGroupKey end;

-- ex4

select *
from (select null as 'OrganizationKey', null as 'DepartmentGroupKey', sum(Amount) as amount
      from FactFinance
      union
      select OrganizationKey as 'OrganizationKey', null as 'DepartmentGroupKey', sum(Amount) as amount
      from FactFinance
      group by OrganizationKey
      union
      select null as 'OrganizationKey', DepartmentGroupKey as 'DepartmentGroupKey', sum(Amount) as amount
      from FactFinance
      group by DepartmentGroupKey
      union
      select OrganizationKey as 'OrganizationKey', DepartmentGroupKey as 'DepartmentGroupKey', sum(Amount) as amount
      from FactFinance
      group by OrganizationKey, DepartmentGroupKey) t
order by OrganizationKey, case when DepartmentGroupKey is null then 999999999 else DepartmentGroupKey end;

-- ex5

with sales as (select sum(Amount) as amount, OrganizationKey
               from FactFinance
               where year(date) = 2012
               group by OrganizationKey)
select percent_rank() over ( order by amount) as percentile, do.OrganizationName, do.OrganizationKey
from sales
         inner join DimOrganization do on do.OrganizationKey = sales.OrganizationKey
order by percentile;

-- ex6

with sales as (select sum(Amount) as amount, stdev(Amount) as stdev, OrganizationKey
               from FactFinance
               where year(date) = 2012
               group by OrganizationKey)
select percent_rank() over ( order by amount) as percentile, do.OrganizationName, do.OrganizationKey, sales.stdev
from sales
         inner join DimOrganization do on do.OrganizationKey = sales.OrganizationKey
order by percentile;


