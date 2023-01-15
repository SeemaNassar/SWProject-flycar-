const mysql = require("mysql");
const util = require("util");
const express = require("express");
var app = express();

const pool = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "flycar",
});
// 'use strict';

// const fs = require('fs');

// let data = 'iVBORw0KGgoAAAANSUhEUgAAABkAAAATCAYAAABlcqYFAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAA' + 
// 'CA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAAsTAAALEwEAmpwYAAABWWlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0' +
// 'YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly' +
// '93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAg' +
// 'ICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZm' +
// 'Y6T3JpZW50YXRpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgpMwidZAAADuUlEQVQ4EbVU' +
// 'TUtcZxR+7ufkXp1SZ4iZRE1EDVQRnTAhowsZMFm40I2rNqUIIev8hvoPQroQXBTqwiAWcd0EglEhiZNajVZrQGXAWAzaZpzMnZn7lXPeeIe5Da' +
// 'Wb9Ax33vOec8/znI/3vVI6nfbxP4v8b/iSJIGfzyGfkPi+D13XUalUBL6qqmIvy5+8WuX/r2RCkUzAoIuLi2hqaoLrutjb28P6+josyxJkiqJA' +
// '07SQXiqVwHaOZYx/itLc3Px9YIxEIlheXsbExATGxsYwMjIiwEdHRwXA/Pw8EokEcrkcDg4OYJomVlZWMDU1JSqfmZlBR0cHbNsOtVoNCHjlTF' +
// 'iSySQMwxAVxONxQbi0tIRMJoPe3l5MT0+jtbUVg4ODYGImY18qlcL4+DhisZjoggCjv1C7uOyenh7Mzs5iY2ND6FQpdnd3sba2JloSjUYxPDyM' +
// '/v5+TE5OYn9/X9jZtrOzg+3t7WqyAUmoEu419/+HBw9E+eVymbJqAJP39fWBCR3HEU+hUMDQ0JCYGc8um81iYGAAjY2N8DwvwBdraCY8tHhDA1' +
// 'Y3N9Hd3S2yvH37O7RcbsF7AuUsD9+8wdOFBTx/8QJtbW1C5/nMzc3R0D2UyxXk83lRXcAk1V5GCT5sSUGDbeHxy9/EO98M9OOXzT9wfHISxKC1' +
// 'vR0GHfOtrS2g/SouWwU0Xkggu7qO9PUkJFULnbIQyTm6ewu2hF+vnOIIUQwdGlg8f4QF6wvMWBq+pAkaskSnx4FFVUf0CNpcC797KizXQ4oAHh' +
// 'VdXJJ81F7j6kwUynPHlXDPdFB2fRj+KVK0KvT2rbp3uKYryJU11Cke8qqMuOoioeeJ1MPDYxM36m1cNSq4GdFx58RAWvbx8TrXnK4IgR16Em5G' +
// 'K4iqHi5GHHxLgcSDn97WgZPoND+GGZRpPYH85cgiiRQl1ltXxmFFQ5PuopP8TrW5ZyRcWp7AbmkeZefg5+N6PPnbRJdpw/YlfB0vQiPQZwVdZN' +
// 'tFZEVK6D1VTnccJlXzuqTjvOZiq6Rhj2KqLSJsofOHgIl8+t0/qsfDioxmSUWGjrRFzhYi/5Oynrdl3KXHIZDXtF6hil8R6I9FBV/RvDLnXKxS' +
// 'bAdVYhNeINXBMwmXWCTQGG2Y+Jj+dFrfEmiMAtmeowpo9ojTvkD+A/L1UJUMmiVfkuz6WTyZhFRJAgP33j3bsM5k/Fng68UP21hYJyyxZwLWuS' +
// '2cKMfUSm3rhD0g4E2g197fwMZ+Bgt8rNe2iP2BhL5dgfFzrx8AfECEDdx45a0AAAAASUVORK5CYII=';

// let buff = new Buffer(data, 'base64');
// fs.writeFileSync('stack-abuse-logo-out.png', buff);

// console.log('Base64 image data converted to file: stack-abuse-logo-out.png');
// //update
/*
pool.connect(function(err) {
 if (err) throw err;
 var sql = "UPDATE signup  SET firstname = 'jawna1' WHERE firstname = 'rahaf'";
 pool.query(sql, function (err, result) {
   if (err) throw err;
    console.log(result.affectedRows + " record(s) updated");
  });
});*/

app.listen(8000, function () {
  console.log("Express server is listening on port 8000");
});

/*
firstname	lastname	email	mobile_number	password*/

///check
app.get("/profile1", function (request, response) {
  console.log(request.query.password);
  ///
  console.log(request.query.email);
  let query1 = `SELECT * FROM signup where email='${request.query.email}'`;

  pool.query(query1, function (error, results) {
    // console.log(results);
    if (error) {
      console.log("error");
      response.status(400).send("Error in database operation");
    } else {
      console.log(results);
      response.send(results);
    }
  });
});
///
//الاسم بربط مع الdrt//
app.get("/signup1", function (request, response) {
  console.log(request.query.password);
  ///

  let query1 = `INSERT INTO signup (firstname,lastname,email,mobile_number,password) 
  VALUES ('${request.query.firstname}','${request.query.lastname}','${request.query.email}','${request.query.mobile_number}','${request.query.password}')`;

  pool.query(query1, function (error, results) {
    if (error) {
      response.status(400).send("Error in database operation");
    } else {
      console.log(results);
      response.send(results);
    }
  });
});

/////// driver
app.get("/driver1", function (request, response) {
  //console.log("hii");
  console.log(request.query.email);
  let query1 = `SELECT * FROM driver where id='${request.query.email}'and password='${request.query.password}'`;

  pool.query(query1, function (error, results) {
    // console.log(results);
    if (error) {
      console.log("error");
      response.status(400).send("Error in database operation");
    } else {
      console.log(results);
      response.send(results);
    }
  });
});
/////////

app.get("/login1", function (request, response) {
  //console.log("hii");
  console.log(request.query.email);
  let query1 = `SELECT * FROM signup where email='${request.query.email}'and password='${request.query.password}'`;

  pool.query(query1, function (error, results) {
    // console.log(results);
    if (error) {
      console.log("error");
      response.status(400).send("Error in database operation");
    } else {
      console.log(results);
      response.send(results);
    }
  });
});
///////company
app.get("/company", function (request, response) {
  //console.log("hii");
  console.log(request.query.email);
  let query1 = `SELECT * FROM user_form`;

  pool.query(query1, function (error, results) {
    // console.log(results);
    if (error) {
      console.log("error");
      response.status(400).send("Error in database operation");
    } else {
      console.log(results);
      response.send(results);
    }
  });
});
/////

app.get("/carr", function (request, response) {
  let query1 = `SELECT * FROM cardetails`;

  pool.query(query1, function (error, results) {
    // console.log(results);
    if (error) {
      response.status(400).send("Error in database operation");
    } else {
      console.log(results);
      response.send(results);
    }
  });
});

app.get("/car", function (request, response) {
  let query1 = `SELECT * FROM cardetails`;

  pool.query(query1, function (error, results) {
    // console.log(results);
    if (error) {
      response.status(400).send("Error in database operation");
    } else {
      console.log(results);
      response.send(results);
    }
  });
});

app.get("/taxi", function (request, response) {
  let query1 = `SELECT * FROM taxiapp`;
  pool.query(query1, function (error, results) {
    // console.log(results);
    if (error) {
      response.status(400).send("Error in database operation");
    } else {
      console.log(results);
      response.send(results);

    }
  });
});

app.get("/carWithDate", function (request, response) {
  let query1 = `SELECT * FROM cardetails where carid='${request.query.carid}'`;

  pool.query(query1, function (error, results) {
    // console.log(results);
    if (error) {
      response.status(400).send("Error in database operation");
    } else {
      console.log(results);
      response.send(results);
    }
  });
});

app.get("/carRentDate", function (request, response) {
//var d1=new date(request.query.startDate);
//console(d1);
  //let query1 = 'SELECT * FROM rentcarDates where startDate='${request.query.startDate}'or endDate='${request.query.endDate}'`;
  //let query1 = `SELECT * FROM rentcarDates where (startDate>='${request.query.startDate}' AND endDate>='${request.query.endDate}') OR (endDate<='${request.query.startDate}' AND startDate>='${request.query.endDate}') `;
  //true>>
  // let query1 = `SELECT * FROM rentcarDates where (startDate<='${request.query.startDate}' and endDate>='${request.query.endDate}') or (endDate<='${request.query.startDate}' and startDate>='${request.query.endDate}') 
  // or (startDate<='${request.query.startDate}' and startDate<='${request.query.endDate}') or (EndDate<='${request.query.startDate}' and EndDate>='${request.query.endDate}') `;
  //true***
  // //let query1 = `SELECT * FROM rentcarDates where (startDate>='${request.query.startDate}' AND startDate<='${request.query.endDate}') OR (endDate>='${request.query.startDate}' AND endDate<='${request.query.endDate}') `;
  //let query1 = `SELECT * FROM rentcarDates where (startDate<='${request.query.startDate}' AND endDate>='${request.query.startDate}') OR (startDate<='${request.query.endDate}' AND endDate>='${request.query.endDate}') `;
  //let query1 = `SELECT * FROM rentcarDates where (startDate between '${request.query.startDate}' AND '${request.query.endDate}') OR (endDate between'${request.query.startDate}' AND '${request.query.endDate}') `;
  //1let query1 = `SELECT * FROM rentcarDates where (startDate<='${request.query.startDate}' AND endDate>='${request.query.startDate}') OR (startDate<='${request.query.endDate}' AND endDate>='${request.query.endDate}') OR (startDate<='${request.query.startDate}' AND endDate>='${request.query.endDate}') OR (endDate<='${request.query.startDate}' AND startDate>='${request.query.endDate}') OR (startDate>='${request.query.startDate}' AND startDate<='${request.query.endDate}') OR (EndDate<='${request.query.startDate}' AND EndDate>='${request.query.endDate}') `;
  //let query1 = `SELECT * FROM rentcarDates where (startDate='${request.query.startDate}')`;
  //AND endDate>='${request.query.endDate}') OR (endDate<='${request.query.startDate}' AND startDate>='${request.query.endDate}') OR (startDate>='${request.query.startDate}' AND startDate<='${request.query.endDate}') OR (EndDate<='${request.query.startDate}' AND EndDate>='${request.query.endDate}') `;
let query1 = `SELECT * FROM rentcarDates`;
 //where (startDate<='${request.query.startDate}' and endDate>='${request.query.startDate}') or (startDate<'${request.query.endDate}' and endDate>'${request.query.endDate}') `;
 
// OR (
// To_date >= '2013-08-19'
// AND From_date <= '2013-08-23'
// )
 // let query1 = `SELECT * FROM cardetails`;
  
  //let query1 = `INSERT INTO rentcarDates(id,carid,userID,startDate,endDate) 
 // VALUES ('${request.query.id}','${request.query.carid}','${request.query.userID}','${request.query.startDate}','${request.query.endDate}')`;

  pool.query(query1, function (error, results) {
    // console.log(results);
    console.log("welcome 1 :");
  console.log(results);
  //console.log(JustADate(results.startDate).toLocaleDateString());
 
    if (error) {
      console.log("error rent ");
      response.status(400).send("Error in database operation");
    } else {
    //   for (var i=0; i<=results; i++){ 
        
    //    // let query2 = `SELECT * FROM cardetails where carid!='${results[0].carid}'`;
    //  };
    //var query2 = "";
  // var i=1;
  //   // query2 += `SELECT * FROM cardetails where carid!='${results[i].carid}'`;
  //    query2 += `SELECT * FROM cardetails where carid!='${results[0].carid}' OR '${
  //     results.forEach(results[i].carid),
  //     i++
  //    }'`;
      //sql += 'SELECT * FROM table WHERE table_name = "' + json[i] + '"; ';
  ///////
      // let query2 = `SELECT * FROM cardetails where carid='${results[0].carid}'`;

      // pool.query(query2, function (error, results) {
      //   // console.log(results);
      //   if (error) {
      //     response.status(400).send("Error in database operation");
      //   } else {
      //     console.log(results);
      //     response.send(results);
      //   }
      // });
      console.log(results);
      response.send(results);
     }
  });});

  app.get("/carRentDateSelectID", function (request, response) {
   let query2 = `SELECT * FROM cardetails where carid!='${request.query.password}'`;
      pool.query(query1, function (error, results) {
        // console.log(results);
        console.log("welcome 1 :");
      console.log(results);
      //console.log(JustADate(results.startDate).toLocaleDateString());
     
        if (error) {
          console.log("error rent ");
          response.status(400).send("Error in database operation");
        } else {

          console.log(results);
          response.send(results);
         }
      });});
/////////////

  app.get("/carRentDateInsert", function (request, response) {
    //let query1 = SELECT * FROM cardetails where carid='${request.query.carid}'and id='${request.query.id}'and userID='${request.query.userID};
    let query1 = `INSERT INTO rentcarDates (id,carid,userID,startDate,endDate,price) VALUES ('${request.query.id}','${request.query.carid}','${request.query.userID}','${request.query.startDate}','${request.query.endDate}','${request.query.price}')`;
 
    pool.query(query1, function (error, results) {
      // console.log(results);
      if (error) {
        response.status(400).send("Error in database operation");
      } else {

        let query2 = `UPDATE signup SET wallet = '${request.query.wall}' where userID='${request.query.userID}'`;
        pool.query(query2, function (error1, results1) {
          // console.log(results);
          console.log("welcome 1 :");
        console.log(results1);
        //console.log(JustADate(results.startDate).toLocaleDateString());
       
          if (error1) {
            console.log("error rent ");
            response.status(400).send("Error in database operation");
          } else {
  
            console.log(results1);
            response.send(results1);
           }
        });
        // console.log(results);
        // response.send(results);
      }
    });});
    //////
   
    app.get("/updateProfile", function (request, response) {

      let query1 = `UPDATE signup SET firstname = '${request.query.firstname}', lastname= '${request.query.lastname}', email='${request.query.email}', mobile_number='${request.query.mobile_number}', password='${request.query.password}' where userID='${request.query.id}'`;
      pool.query(query1, function (error, results) {
        // console.log(results);
        console.log("welcome 1 :");
      console.log(results);
      //console.log(JustADate(results.startDate).toLocaleDateString());
     
        if (error) {
          console.log("error rent ");
          response.status(400).send("Error in database operation");
        } else {

          console.log(results);
          response.send(results);
         }
      });
    });
    ////
  app.get("/carsearch", function (request, response) {

    let query1 = `SELECT * FROM cardetails where carname='${request.query.carname}'`;

    pool.query(query1, function (error, results) {
      // console.log(results);
      if (error) {
        response.status(400).send("Error in database operation");
      } else {
        console.log(results);
        response.send(results);
      }
    });
  });
  


