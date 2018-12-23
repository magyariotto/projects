function mainpagecreate()
//fő oldal betöltése
{
    try
    {
        var mainpage = document.createElement("DIV");
            mainpage.className= "mainpage";
            mainpage.id = "map";
            mainpage.style.width = window.innerWidth - 530;
            mainpage.style.height = window.innerHeight - 100;
            mainpage.style.left = 270;
            mainpage.style.top = 45;
            
            var content = mapload();
        mainpage.appendChild(content);
        document.body.appendChild(mainpage);
    }
    catch(err)
    {
        document.getElementById("error").innerHTML = "mainpagecreate - " + err.name + ": " + err.message;
    }
}

    function mapload()
    //térkép betöltése
    {
        try
        {
            var table = document.createElement("TABLE");
                table.id = "maptable";
                table.style.width = 1500;
                table.style.height = 1500;
                
                var xcord, row;
                for(xcord = 0; xcord < 10; xcord++)
                {
                    row = rowcreate(xcord);
                    table.appendChild(row);
                }
        }
        catch(err)
        {
            document.getElementById("error").innerHTML = "mapliad - " + err.name + ": " + err.message;
        }
        finally
        {
            return table;
        }
    }
    
        function rowcreate(xcord)
        //sor betöltése a térképbe
        {
            try
            {
                var row = document.createElement("TR");
                    var ycord, cell;
                    for(ycord = 0; ycord < 10; ycord++)
                    {
                        cell = cellcreate(xcord, ycord);
                        row.appendChild(cell);
                    }
            }
            catch(err)
            {
                document.getElementById("error").innerHTML = "rowcreate - " + err.name + ": " + err.message;
            }
            finally
            {
                return row;
            }
        }
        
            function cellcreate(xcord, ycord)
            //egy térképcella betöltése
            {
                try
                {
                    var fieldid = "f" + xcord + ycord;
                    var field = gamedata.fields[fieldid];
                    
                    var txt;
                        if(field.reveal == "" && field.ownerplayer != "player")
                        {
                            txt = "Nem felfedezett";
                        }
                        else if(field.ownerplayer == "player")
                        {
                            txt = "capital";
                        }
                        else
                        {
                            txt = field.reveal
                        }
                    var cell = document.createElement("TD");
                        cell.id = "mapcell" + fieldid;
                        cell.className = "mapcell";
                        cell.addEventListener("click", function(){mainfieldload(fieldid)});
                        var div = document.createElement("DIV");
                            div.className = "mapcelltitle";
                            div.appendChild(document.createTextNode(fieldid + " - " +field.fieldname));
                            
                    cell.appendChild(div);
                        var txtnode = document.createTextNode(txt);
                    cell.appendChild(txtnode);
                }
                catch(err)
                {
                    document.getElementById("error").innerHTML = "cellcreate - " + err.name + ": " + err.message;
                }
                finally
                {
                    return cell;
                }
            }