/*
 * Use a JOIN to display the first and last names, as well as the address, of each staff member.
 * Use the tables staff and address.
 * Order by last name.
 */

SELECT
    stf.first_name, stf.last_name, adr.address AS "street_address"
FROM staff stf
JOIN address adr
ON stf.address_id=adr.address_id
ORDER BY stf.last_name;
