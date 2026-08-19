SELECT
CASE 
    WHEN NOT ((A+B>C) AND (B+C>A) AND (A+C>B)) THEN 'Not A Triangle' 
    WHEN A=B AND B=C AND C=A THEN 'Equilateral' 
    WHEN (A=B AND B<>C) OR (A=C AND C<>B) OR (A<>B AND B=C) THEN 'Isosceles' 
    WHEN A<>B AND B<>C AND C<>A THEN 'Scalene'
END
FROM TRIANGLES;