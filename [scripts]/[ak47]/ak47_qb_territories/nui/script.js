let blips = [];
let colors = [];
var rankID = 1;

$(".main").hide();
$("#logo").hide(); 
$("#areainfo").hide(); 

function saveTemplate(template) {
  localStorage.setItem('gangTemplate', JSON.stringify(template));
}

function loadTemplate() {
  return JSON.parse(localStorage.getItem('gangTemplate') || 'null');
}

$(document).ready(function() {
    // Add new rank fieldset when + button is clicked
    $('#addRank').click(function() {
        var newRank = `
            <fieldset class="form-group rankFieldset">
                <div class="form-group row">
                    <div class="col col-md-2">
                        <label class="font-weight-bold" for="rankTagId${rankID}">Rank</label>
                        <input type="number" class="form-control" id="rankTagId" value = ${rankID} required>
                    </div>
                    <div class="col">
                        <label class="rankTagLabel font-weight-bold" for="rankTag${rankID}">Tag</label>
                        <input type="text" class="form-control text-lowercase" id="rankTag${rankID}" placeholder="Enter rank tag" required>
                    </div>
                    <div class="col">
                        <label class="rankLabelLabel font-weight-bold" for="rankLabel${rankID}">Label</label>
                        <input type="text" class="form-control text-capitalize" id="rankLabel${rankID}" placeholder="Enter rank label" required>
                    </div>
                    <div class="col col-md-1">
                        <label for="rankDel${rankID}">.</label>
                        <button type="button" class="btn btn-danger removeRankButton">X</button>
                    </div>
                </div>
            </fieldset>
        `;

        // Append new rank fieldset to rankContainer
        $('#rankContainer').append(newRank);

        // Increment rankID
        rankID++;

        // Scroll to the bottom of the rankContainer
        $("#rankContainer").children().last()[0].scrollIntoView({ behavior: 'smooth' });
    });

    // Remove rank fieldset when 'Remove Rank' button is clicked
    $('#rankContainer').on('click', '.removeRankButton', function() {
        // Remove the rank fieldset
        $(this).closest('.rankFieldset').remove();

        // Reassign rank IDs for all remaining ranks
        $('.rankFieldset').each(function(index) {
            var newRankID = index + 1;
            $(this).find('.rankTagLabel').attr('for', `rankTag${newRankID}`);
            $(this).find('.rankLabelLabel').attr('for', `rankLabel${newRankID}`);
            $(this).find('input[type="number"]').val(newRankID);
            $(this).find('input[type="text"]:first').attr('id', `rankTag${newRankID}`);
            $(this).find('input[type="text"]:last').attr('id', `rankLabel${newRankID}`);
        });

        // Decrement rankID
        rankID--;
    });


    // Handle form submission
    $('#form').on('submit', function (e) {
        e.preventDefault();
        var selectedIcon = $('#iconDropdown').val();
        var selectedColor = $('#colorDropdown').val();

        // Get gang tag and label
        var gangTag = $('#gangTag').val();
        var gangLabel = $('#gangLabel').val();

        // Array to hold ranks
        var ranks = [];
        
        // Get ranks
        $('.rankFieldset').each(function (index) {
            var rankID = index + 1;
            var rankTag = $('#rankTag' + rankID).val();
            var rankLabel = $('#rankLabel' + rankID).val();
            ranks.push({id: rankID, tag: rankTag, label: rankLabel});
        });

        // Reset rankID
        rankID = 1;

        $.post('https://ak47_qb_territories/creategang', JSON.stringify({
            blip: selectedIcon,
            color: selectedColor,
            tag: gangTag,
            label: gangLabel,
            ranks: ranks
        }));

        var template = {
          blip: selectedIcon,
          color: selectedColor,
          ranks: ranks
        };

        saveTemplate(template);

        $(".main").fadeOut(100, function(){
            $('#gangTag').val('');
            $('#gangLabel').val('');

            var firstIconOption = $('#iconDropdown').find("option:first").val();
            var firstColorOption = $('#colorDropdown').find("option:first").val();
            $('#iconDropdown').val(firstIconOption).trigger('change');
            $('#colorDropdown').val(firstColorOption).trigger('change');

            $('.rankFieldset').remove();
            var newRank = `
                <fieldset class="form-group rankFieldset">
                    <div class="form-group row">
                        <div class="col col-md-2">
                            <label class="font-weight-bold" for="rankTagId${rankID}">Rank</label>
                            <input type="number" class="form-control" id="rankTagId" value = ${rankID} required>
                        </div>
                        <div class="col">
                            <label class="rankTagLabel font-weight-bold" for="rankTag${rankID}">Tag</label>
                            <input type="text" class="form-control text-lowercase" id="rankTag${rankID}" placeholder="Enter rank tag" required>
                        </div>
                        <div class="col">
                            <label class="rankLabelLabel font-weight-bold" for="rankLabel${rankID}">Label</label>
                            <input type="text" class="form-control text-capitalize" id="rankLabel${rankID}" placeholder="Enter rank label" required>
                        </div>
                        <div class="col col-md-1">
                            <label for="rankDel${rankID}">.</label>
                            <button type="button" class="btn btn-danger removeRankButton" disabled>X</button>
                        </div>
                    </div>
                </fieldset>
            `;

            // Append new rank fieldset to rankContainer
            $('#rankContainer').append(newRank);

            // Increment rankID
            rankID++;
        });
    });

    // Function to format color
    function formatColor(color) {
        if (!color.id) { return color.text; }
        var $color = $(
            '<span><i class="fa fa-square" style="color:' + color.hex + ';"></i> ' + color.name + '</span>'
        );
        return $color;
    };

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type == 'show'){
            $(".main").fadeIn(150, function() {
              var template = loadTemplate();
              if (template) {
                // restore icon + color
                $('#iconDropdown').val(template.blip).trigger('change');
                $('#colorDropdown').val(template.color).trigger('change');

                // clear out any auto-generated ranks and reset counter
                $('#rankContainer').empty();
                rankID = 1;

                // re-build each rank from the template
                template.ranks.forEach(function(rank) {
                  var id = rankID;
                  var fieldset = `
                    <fieldset class="form-group rankFieldset">
                      <div class="form-group row">
                        <div class="col col-md-2">
                          <label class="font-weight-bold" for="rankTag${id}">Rank</label>
                          <input type="number" class="form-control" id="rankTagId" value="${id}" required>
                        </div>
                        <div class="col">
                          <label class="rankTagLabel font-weight-bold" for="rankTag${id}">Tag</label>
                          <input type="text" class="form-control text-lowercase" id="rankTag${id}" value="${rank.tag}" required>
                        </div>
                        <div class="col">
                          <label class="rankLabelLabel font-weight-bold" for="rankLabel${id}">Label</label>
                          <input type="text" class="form-control text-capitalize" id="rankLabel${id}" value="${rank.label}" required>
                        </div>
                        <div class="col col-md-1">
                          <label for="rankDel${id}">.</label>
                          <button type="button" class="btn btn-danger removeRankButton"${ id === 1 ? ' disabled' : '' }>X</button>
                        </div>
                      </div>
                    </fieldset>
                  `;
                  $('#rankContainer').append(fieldset);
                  rankID++;
                });
              }
            });
        }else if (item.type == 'set'){
            blips = item.blips;
            colors = item.colors;

            var newRank = `
                <fieldset class="form-group rankFieldset">
                    <div class="form-group row">
                        <div class="col col-md-2">
                            <label class="font-weight-bold" for="rankTagId${rankID}">Rank</label>
                            <input type="number" class="form-control" id="rankTagId" value = ${rankID} required>
                        </div>
                        <div class="col">
                            <label class="rankTagLabel font-weight-bold" for="rankTag${rankID}">Tag</label>
                            <input type="text" class="form-control text-lowercase" id="rankTag${rankID}" placeholder="Enter rank tag" required>
                        </div>
                        <div class="col">
                            <label class="rankLabelLabel font-weight-bold" for="rankLabel${rankID}">Label</label>
                            <input type="text" class="form-control text-capitalize" id="rankLabel${rankID}" placeholder="Enter rank label" required>
                        </div>
                         <div class="col col-md-1">
                            <label for="rankDel${rankID}">.</label>
                            <button type="button" class="btn btn-danger removeRankButton" disabled>X</button>
                        </div>
                    </div>
                </fieldset>
            `;

            // Append new rank fieldset to rankContainer
            $('#rankContainer').append(newRank);

            // Increment rankID
            rankID++;

            $('#colorDropdown').select2({
                width: '100%',  // Set width to 100%
                data: $.map(colors, function (color, key) {
                    return { id: key, name: key.toUpperCase(), hex: color.hex };
                }),
                templateResult: formatColor,
                templateSelection: formatColor
            });
        }else if (item.type == 'logoshow'){
            $("#logo").show();
            $("#logo").find("span").html(item.label + " - " + item.ranklabel )
        }else if (item.type == 'logohide'){
            document.getElementById('logo').hide
            $("#logo").hide();
        } else if (item.type == 'areainfo'){
            if (item.visible){
                let value = item.yourinfuence;
                let color = '#00ff00'; // default green

                if (value) {
                    if (value < 30) {
                        color = '#ff1100'; // red
                    } else if (value < 70) {
                        color = '#ffc107'; // yellow
                    }
                    $("#yourinflunce").text(value + '%').css('color', color);
                    $("#yourinflunce").show()
                    $("#yourinfluncetitle").show()
                }else{
                    $("#yourinflunce").hide()
                    $("#yourinfluncetitle").hide()
                }
                if (item.control) {
                    $("#controlling").text(item.control);
                    $("#controlling").show()
                    $("#controllingtitle").show()
                }else {
                    $("#controllingtitle").hide()
                    $("#controlling").hide()
                }
                
                $("#areaname").text('['+item.area+']');
                $("#areainfo").fadeIn(500);

                if (item.flash) {
                    setTimeout(function(){
                        $("#areainfo").fadeOut(500);
                    }, 5000)
                }
            }else {
                $("#areainfo").fadeOut(500);
            }
            
        }
    });
});

$(document).keyup(function(e) {
    if (e.key === "Escape") { // ESC key maps to keycode `27`
        if ($(".main").is(":visible")) {
          $(".main").fadeOut(100);
          $.post('https://ak47_qb_territories/close', JSON.stringify({
                menu: true
          }));
        }else if($(".leaderboard-container").is(":visible")) {
            $(".leaderboard-container").fadeOut(100);
            $.post('https://ak47_qb_territories/close', JSON.stringify({
                menu: false
            }));
        }
    }
});