$(".leaderboard-container").hide();

let gangData = [
  // { tag: 'tagA', label: 'Gang A', influence: 95, color: '#e03232' },
  // { tag: 'tagB', label: 'Gang B', influence: 90, color: '#eec64e' },
  // { tag: 'tagC', label: 'Gang C', influence: 80, color: '#b18f83' },
  // { tag: 'tagD', label: 'Gang D', influence: 65, color: '#6ac4bf' },
  // { tag: 'tagE', label: 'Gang E', influence: 85, color: '#bbd65b' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' },
  // { tag: 'tagF', label: 'Gang F', influence: 85, color: '#0c7b56' }
];

let playerData = [
  // { name: 'Player 1', tag: 'tagA', crates: 20, kills: 50 },
  // { name: 'Player 2', tag: 'tagA', crates: 30, kills: 40 },
  // { name: 'Player 3', tag: 'tagB', crates: 10, kills: 70 },
  // { name: 'Player 4', tag: 'tagC', crates: 25, kills: 55 },
  // { name: 'Player 5', tag: 'tagD', crates: 15, kills: 45 },
  // { name: 'Player 6', tag: 'tagD', crates: 15, kills: 45 },
  // { name: 'Player 7', tag: 'tagD', crates: 15, kills: 45 },
  // { name: 'Player 8', tag: 'tagE', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 },
  // { name: 'Player 9', tag: 'tagF', crates: 15, kills: 45 }
];

// Global variables to track the active view and sort state.
let activeView = 'player'; // "player" or "gang"
let currentSort = { column: null, ascending: true };

// Update header indicators (for CSS styling, if you later add CSS rules for .sort-asc/.sort-desc)
function updateSortIndicators() {
  document.querySelectorAll('#leaderboard thead th').forEach(th => {
    th.classList.remove('sort-asc', 'sort-desc');
    if (th.getAttribute('data-sort') === currentSort.column) {
      th.classList.add(currentSort.ascending ? 'sort-asc' : 'sort-desc');
    }
  });
}

// Only attach sort click handlers to numeric columns based on the active view.
function setupSortHandlers() {
  const numericColumns = activeView === 'player'
    ? ['crates', 'kills']
    : ['crates', 'kills', 'influence'];

  // The header has just been (re)created, so attach listeners only on allowed columns.
  document.querySelectorAll('#leaderboard thead th').forEach(th => {
    const sortColumn = th.getAttribute('data-sort');
    // Remove any previously assigned cursor style if not numeric.
    if (numericColumns.includes(sortColumn)) {
      th.style.cursor = 'pointer';
      th.addEventListener('click', function() {
        sortData(sortColumn);
        updateSortIndicators();
      });
    } else {
      th.style.cursor = 'default';
    }
  });
}

// Toggle sort state and re-render the current view for allowed numeric columns.
function sortData(column) {
  const numericColumns = activeView === 'player'
    ? ['crates', 'kills']
    : ['crates', 'kills', 'influence'];
  if (!numericColumns.includes(column)) return; // only sort numeric columns

  if (currentSort.column === column) {
    currentSort.ascending = !currentSort.ascending;
  } else {
    currentSort.column = column;
    currentSort.ascending = false; // default to descending (high first)
  }

  if (activeView === 'player') {
    renderPlayerTable();
  } else if (activeView === 'gang') {
    renderGangTable();
  }
}

// Renders the PLAYER view.
function renderPlayerTable() {
  // Update table header for PLAYER view.
  document.querySelector('#leaderboard thead tr').innerHTML = `
    <th data-sort="name">Player</th>
    <th data-sort="label">Gang</th>
    <th data-sort="crates">Crates</th>
    <th data-sort="kills">Kills</th>
  `;

  let players = playerData.slice();

  // Set default sort to "kills" descending if no sort has been applied
  if (!currentSort.column) {
    currentSort.column = 'kills';
    currentSort.ascending = false;
  }

  // If the current sort column is allowed (numeric) sort the player data.
  if (['crates', 'kills'].includes(currentSort.column)) {
    players.sort((a, b) => {
      let valA = a[currentSort.column],
          valB = b[currentSort.column];
      return currentSort.ascending ? valA - valB : valB - valA;
    });
  }

  const tbody = document.querySelector('#leaderboard tbody');
  tbody.innerHTML = '';

  players.forEach((p, index) => {
    // Look up gang info using the tag.
    const gang = gangData.find(g => g.tag === p.tag) || {};
    const color = gang.color || "#fff";
    const label = gang.label || "Unknown";

    const tr = document.createElement('tr');
    if (index < 3) {
      tr.classList.add('top' + index);
    }
    tr.style.color = color;
    tr.innerHTML = `
      <td>${p.name}</td>
      <td>${label}</td>
      <td>${p.crates}</td>
      <td>${p.kills}</td>
    `;
    tbody.appendChild(tr);
  });
  setupSortHandlers();
  updateSortIndicators();
}

// Renders the GANG view.
function renderGangTable() {
  // Update table header for GANG view.
  document.querySelector('#leaderboard thead tr').innerHTML = `
    <th data-sort="label">Label</th>
    <th data-sort="crates">Crates</th>
    <th data-sort="kills">Kills</th>
    <th data-sort="influence">Influence</th>
  `;

  let aggregatedData = gangData.map(g => {
    const players = playerData.filter(p => p.tag === g.tag);
    const totalCrates = players.reduce((sum, p) => sum + p.crates, 0);
    const totalKills = players.reduce((sum, p) => sum + p.kills, 0);
    return {
      tag: g.tag,
      label: g.label,
      crates: totalCrates,
      kills: totalKills,
      influence: g.influence,
      color: g.color
    };
  });

  // Set default sort to "influence" descending if no sort has been applied
  if (!currentSort.column) {
    currentSort.column = 'influence';
    currentSort.ascending = false;
  }

  if (['crates', 'kills', 'influence'].includes(currentSort.column)) {
    aggregatedData.sort((a, b) => {
      let valA = a[currentSort.column],
          valB = b[currentSort.column];
      return currentSort.ascending ? valA - valB : valB - valA;
    });
  }

  const tbody = document.querySelector('#leaderboard tbody');
  tbody.innerHTML = '';

  aggregatedData.forEach((item, index) => {
    const tr = document.createElement('tr');
    if (index < 3) {
      tr.classList.add('top' + index);
    }
    tr.style.color = item.color;
    tr.innerHTML = `
      <td>${item.label}</td>
      <td>${item.crates}</td>
      <td>${item.kills}</td>
      <td>${item.influence}</td>
    `;
    tbody.appendChild(tr);
  });
  setupSortHandlers();
  updateSortIndicators();
}

// --- BUTTON EVENT HANDLERS ---
// For Player view, set default sort to kills (highest first)
document.getElementById('playerBtn').addEventListener('click', function() {
  activeView = 'player';
  currentSort = { column: 'kills', ascending: false };
  renderPlayerTable();
  this.classList.add('active');
  document.getElementById('gangBtn').classList.remove('active');
});

// For Gang view, set default sort to influence (highest first)
document.getElementById('gangBtn').addEventListener('click', function() {
  activeView = 'gang';
  currentSort = { column: 'influence', ascending: false };
  renderGangTable();
  this.classList.add('active');
  document.getElementById('playerBtn').classList.remove('active');
});

window.addEventListener('message', function(event) {
  var item = event.data;
  if (item.type == 'leaderboard'){
    if (item.visible) {
      gangData = item.gangData
      playerData = item.playerData
      renderPlayerTable();
      document.getElementById('playerBtn').classList.add('active');
      $(".leaderboard-container").fadeIn(100); 
    } else {
      $(".leaderboard-container").fadeOut(100); 
    }
  }
});

// Set initial view to player when document is ready.
$(document).ready(function() {
  activeView = 'player';
  currentSort = { column: 'kills', ascending: false };
  renderPlayerTable();
  document.getElementById('playerBtn').classList.add('active');
});
