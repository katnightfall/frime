let audioPlayer = null;
const store = Vuex.createStore({
    components: {},
    getters: {},
    mutations: {},
    actions: {}
});

const app = Vue.createApp({
    components: {},
    data: () => ({
        mainShow: false,
        createMenuShow: false,
        foldMenuShow: false,
        tableCenterShow: false,
        gameShow: false,
        marketMenuShow: false,
        tutoMenuShow: false,
        tebexPopup: false,
        tebexSystem: true,
        devMode: false,
        finishShow: false,
        requestMenuShow: false,
        screenTuto: false,
        tutorialName: '',
        tutorialQueue: [],
        reqestHostName: "Tworst Shop",
        notifyShow: false,
        playerShow: false,
        scoreBoxShow: true,
        distanceBoxShow: false,
        distanceHeight: 0,


        progressbar: 0,
        progressbarLabel: "",
        moneyType: "$",
        serverName: "TWORST",
        finishjobData: false,
        notifications: [],
        colorList: {
            "darkblue": "#000080",
            "purple": "#800080",
            "black": "#000000",
            "white": "#FFFFFF",
            "blue": "#0000FF"
        },
        Locales: {},
        tutorialList: [],

        invitePlayer: {
            1: false,
            2: false,
            3: false,
            4: false
        },
        jobStart: false,
        progressData: [],
        inviteModal: "",
        tebexreedemcode: "",
        allClothesAmount: {},
        createrMenu: {
            logo: '',
            isLogoDroppedCorrectly: false,
            count: 0,
            selectedClothes: 'tshirtcraft',
            selectedColor: 'darkblue',
            createdImage: false
        },
        playerData: {},
        playerListData: [],
        selectRegionData: false,
        regionData: [{}, {}, {}],
        dailyMission: [],
        totalCompleted: 0,
        playerDailyMission: [],
        requstData: {},
        foldStep: 0,
        foldClothesData: {
            count: 0,
            selectedClothes: 'sweatercraft', // sweatercraft || tshirtcraft
            selectedColor: 'white',
            selectedLogo: ''
        },
        foldData: {},
        materialsNeeded: [],
        playerInventory: [],
        searchItem: "",
        marketItems: [],
        defaultLogoList: [],
        // ütü
        ctx: null,
        steamCtx: null,
        isIroning: false,
        gameOver: false,
        burned: false,
        ironHeat: 0,
        lastIronPosition: { x: 0, y: 0 },
        mouseX: 0,
        mouseY: 0,
        steamParticles: [],
        shirtMask: null,
        initialTotalAlpha: 0,
        lastHeatUpdateTime: Date.now(),
        // Sabitler
        MAX_HEAT: 100,
        HEAT_INCREASE: 2,
        STATIC_HEAT_BONUS: 3,
        HEAT_DECREASE: 0.2,
        consecutiveChecks: 0,
        warningBlink: false,

        // interaction
        targetEntities: [],
        currentEntity: null,
        optionVisible: false,
        progress: {
            currentOffset: Math.PI * 2 * 45,
            isActive: false,
            duration: 1500,
            animation: null
        },
        buttonInteractionId: null,
        displayInteractionId: null,
        typeInteraction: null,
        indexInteraction: null,
        steamSoundPlaying: false,
        frameCount: 0,
        lastGameCheckTime: 0
    }),

    watch: {
        // materialsNeeded veya createrMenu değiştiğinde çalışır
        "createrMenu.selectedClothes": "updateMaterialCounts",
        "createrMenu.selectedColor": "updateMaterialCounts",
        materialsNeeded: {
            handler: "updateMaterialCounts",
            deep: true,
        },
        playerInventory: {
            handler: "updateMaterialCounts",
            deep: true,
        },
    },

    beforeDestroy() {
        document.removeEventListener('mousemove', this.handleMouseMove)
        document.removeEventListener('mouseup', () => this.isIroning = false)
        document.removeEventListener('mouseleave', () => {
            this.isIroning = false
            document.getElementById('iron').style.display = 'none'
        })
    },
    mounted() {

        window.addEventListener("keyup", this.keyHandler);
        window.addEventListener("message", this.eventHandler);
        this.updateMaterialCounts();
        this.initializeDroppable();
        this.initializeDraggable();
        this.checkInterval = setInterval(() => {
            if (this.notifications.length > 0) {
                this.notifications = this.notifications.filter((notification, index, self) =>
                    index === self.findIndex(n => n.message === notification.message)
                );

                this.notifyShow = true;
                let delays = [];
                this.notifications.slice(0, 3).forEach((notification, index) => {
                    let delay = setTimeout(() => {
                        const indexToRemove = this.notifications.indexOf(notification);
                        if (indexToRemove !== -1) {
                            this.notifications.splice(indexToRemove, 1);
                            if (this.notifications.length === 0) {
                                this.notifyShow = false;
                            }
                        }
                        clearTimeout(delays[indexToRemove]);
                    }, 1500 * (index + 1));

                    delays.push(delay);
                });
            }
        }, 0);




    },

    methods: {
        opentutorial() {
            this.tutoMenuShow = true;
        },
        addNotification(notification) {
            this.notifications.push(notification);
        },
        toggleBox(index) {
            this.tutorialList[index].isOpen = !this.tutorialList[index].isOpen;
        },
        calculateRemainingWrinkles() {
            if (!this.ctx || !this.$refs.wrinkleCanvas) return 0;

            const imageData = this.ctx.getImageData(0, 0, this.$refs.wrinkleCanvas.width, this.$refs.wrinkleCanvas.height);
            const pixels = imageData.data;
            let remainingPixels = 0;
            const threshold = 40;

            // Her 4 pikselde bir kontrol et (performans için)
            for (let i = 3; i < pixels.length; i += 16) {
                if (pixels[i] > threshold) {
                    remainingPixels++;
                }
            }

            // Örnekleme faktörünü hesaba kat
            return remainingPixels * 4;
        },

        checkGameOver() {
            const remainingWrinkles = this.calculateRemainingWrinkles();

            // Bitiş için gereken kırışıklık miktarını azalttık
            if (remainingWrinkles < 100) { // 50'den 100'e çıkardık - daha kolay bitiş
                if (!this.consecutiveChecks) {
                    this.consecutiveChecks = 1;
                } else {
                    this.consecutiveChecks++;
                }

                // Kontrol sayısını azalttık
                if (this.consecutiveChecks >= 2) { // 3'ten 2'ye düşürdük
                    this.gameOver = true;
                    this.onGameComplete(true);
                }
            } else {
                this.consecutiveChecks = 0;
            }
        },

        onGameComplete(success) {
            stopsound();
            this.gameOver = true;

            if (success) {
                this.notifications.push({
                    message: this.Locales['successMinigame'],
                    type: 'succesNotify'
                })

            } else {
                this.notifications.push({
                    message: this.Locales['failedMinigame'],
                    type: 'errorNotify'
                })
            }

            //this.resetGame();
            this.gameShow = false;
            postNUI('closeGame', { success: success, foldData: this.foldData });
            stopsound();
        },
        initializeGame() {
            const wrinkleCanvas = this.$refs.wrinkleCanvas
            const steamCanvas = this.$refs.steamCanvas

            const canvasSize = Math.floor(window.innerWidth * 0.36) // 690px'e denk gelen oran
            wrinkleCanvas.width = steamCanvas.width = canvasSize
            wrinkleCanvas.height = steamCanvas.height = canvasSize


            this.ctx = wrinkleCanvas.getContext('2d')
            this.steamCtx = steamCanvas.getContext('2d')

            // Kıyafet maskesini yükle
            this.shirtMask = new Image()
            if (this.foldClothesData.selectedClothes === 'tshirtcraft') {
                this.shirtMask.src = `./img/${this.foldClothesData.selectedClothes}/${this.foldClothesData.selectedColor}/tshirtFull.png`
            } else if (this.foldClothesData.selectedClothes === 'sweatercraft') {
                this.shirtMask.src = `./img/${this.foldClothesData.selectedClothes}/${this.foldClothesData.selectedColor}/longTshirt.png`
            }
            this.shirtMask.onload = () => {
                this.createWrinkles()
                this.gameLoop()
            }

            // Event listener'ları ekle
            this.addEventListeners()
        },

        getShirtBoxStyle() {
            if (this.createrMenu.selectedClothes === 'tshirtcraft') {
                return {
                    backgroundImage: `url('./img/${this.createrMenu.selectedClothes}/${this.createrMenu.selectedColor}/tshirtFull.png')`,
                    backgroundSize: 'cover', // Arka plan boyutlandırması için
                    backgroundPosition: 'center', // Arka plan konumlandırması için
                };
            } else if (this.createrMenu.selectedClothes === 'sweatercraft') {
                return {
                    backgroundImage: `url('./img/${this.createrMenu.selectedClothes}/${this.createrMenu.selectedColor}/longTshirt.png')`,
                    backgroundSize: 'cover',
                    backgroundPosition: 'center',
                };
            } else {
                return {}; // Varsayılan bir stil, gerekirse eklenebilir
            }
        },

        addEventListeners() {
            document.addEventListener('mousemove', this.handleMouseMove)


            document.addEventListener('mousedown', () => {
                this.isIroning = true;
            });
            document.addEventListener('mouseup', () => {
                this.isIroning = false;
            });


            document.addEventListener('mouseleave', () => {
                this.isIroning = false
                document.getElementById('iron').style.display = 'none'
            })
        },

        handleMouseMove(e) {
            const iron = document.getElementById('iron')
            iron.style.display = 'block'
            iron.style.cursor = 'none'
            iron.style.left = e.pageX + 'px'
            iron.style.top = e.pageY + 'px'

            const rect = this.$refs.wrinkleCanvas.getBoundingClientRect()
            this.mouseX = e.clientX - rect.left
            this.mouseY = e.clientY - rect.top
        },

        isInsideShirt(x, y) {
            // Daha geniş bir alanı kontrol edelim
            const margin = 5; // 5 piksellik bir marj ekleyelim
            const imageData = this.ctx.getImageData(x - margin, y - margin, margin * 2, margin * 2);
            const pixels = imageData.data;

            // Kontrol edilen alan içinde herhangi bir opak piksel varsa true döndür
            for (let i = 3; i < pixels.length; i += 4) {
                if (pixels[i] > 0) return true;
            }
            return false;
        },

        updateHeat() {
            if (this.isIroning) {
                // Isınma hızını 2.0'dan 4.0'a çıkardık
                this.ironHeat = Math.min(100, this.ironHeat + 4.0);

                if (this.ironHeat >= 95 && this.isIroning) {
                    this.warningBlink = !this.warningBlink;
                    if (this.ironHeat >= 99) {
                        this.burnClothes();
                        return;
                    }
                }
            } else {
                // Soğuma hızını da artıralım
                this.ironHeat = Math.max(0, this.ironHeat - 1.0);
            }

            const heatIndicator = document.getElementById('heat-indicator');
            if (heatIndicator) {
                heatIndicator.style.height = `${this.ironHeat}%`;
                if (this.ironHeat >= 95) {
                    heatIndicator.style.backgroundColor = this.warningBlink ? '#ff4444' : '#ff8888';
                } else {
                    heatIndicator.style.backgroundColor = '';
                }
            }
        },
        burnClothes() {
            this.gameOver = true;

            setTimeout(() => {
                this.resetGame();
                this.onGameComplete(false);
            }, 1000);
        },

        createSteamParticle(x, y) {
            return {
                x: x + (Math.random() - 0.5) * 15, // 10'dan 15'e çıkardık
                y: y - 8, // 5'ten 8'e çıkardık
                size: Math.random() * 6 + 3, // 4+2'den 6+3'e çıkardık
                speedX: (Math.random() - 0.5) * 1.5, // 1'den 1.5'e çıkardık
                speedY: -Math.random() * 3 - 1.5, // 2-1'den 3-1.5'e çıkardık
                opacity: Math.random() * 0.5 + 0.2, // 0.4+0.1'den 0.5+0.2'ye çıkardık
                life: 1.2, // 1'den 1.2'ye çıkardık
                decay: Math.random() * 0.015 + 0.008 // Biraz daha yavaş kaybolması için değerleri düşürdük
            }
        },

        updateAndDrawSteam() {
            if (!this.steamCtx || !this.$refs.steamCanvas) return;

            this.steamCtx.clearRect(0, 0, this.$refs.steamCanvas.width, this.$refs.steamCanvas.height);

            if (this.isIroning && !this.gameOver) {
                // Ütüleme başladığında buhar sesi çal
                if (!this.steamSoundPlaying) {
                    clicksound("iron_sound.mp3");
                    this.steamSoundPlaying = true;
                }

                // Daha az parçacık oluştur
                if (this.steamParticles.length < 50) { // Maksimum parçacık sayısını sınırla
                    for (let i = 0; i < 2; i++) { // Her seferinde daha az parçacık ekle
                        this.steamParticles.push(this.createSteamParticle(this.mouseX, this.mouseY));
                    }
                }
            } else {
                if (this.steamSoundPlaying) {
                    stopsound();
                    this.steamSoundPlaying = false;
                }
            }

            // Parçacıkları toplu olarak çiz
            this.steamCtx.save();
            for (let i = this.steamParticles.length - 1; i >= 0; i--) {
                const particle = this.steamParticles[i];

                particle.x += particle.speedX;
                particle.y += particle.speedY;
                particle.life -= particle.decay;
                particle.opacity *= 0.98;

                if (particle.life <= 0 || this.gameOver) {
                    this.steamParticles.splice(i, 1);
                    continue;
                }

                const gradient = this.steamCtx.createRadialGradient(
                    particle.x, particle.y, 0,
                    particle.x, particle.y, particle.size
                );
                gradient.addColorStop(0, `rgba(255, 255, 255, ${particle.opacity})`);
                gradient.addColorStop(1, 'rgba(255, 255, 255, 0)');

                this.steamCtx.beginPath();
                this.steamCtx.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
                this.steamCtx.fillStyle = gradient;
                this.steamCtx.fill();
            }
            this.steamCtx.restore();
        },

        removeWrinkles(x, y) {
            if (this.gameOver) return

            this.ctx.globalCompositeOperation = 'destination-out'
            // Etki alanını daha da artırıyoruz
            const effectStrength = Math.min(100 + (this.ironHeat * 0.8), 150) // Değerleri daha da artırdık

            const gradient = this.ctx.createRadialGradient(x, y, 0, x, y, effectStrength)
            gradient.addColorStop(0, 'rgba(255, 255, 255, 1)')
            gradient.addColorStop(0.4, 'rgba(255, 255, 255, 0.95)') // Daha yumuşak geçiş
            gradient.addColorStop(0.8, 'rgba(255, 255, 255, 0.8)') // Daha geniş etki alanı
            gradient.addColorStop(1, 'rgba(255, 255, 255, 0.1)') // Tamamen şeffaf yerine hafif bir etki

            this.ctx.fillStyle = gradient
            this.ctx.beginPath()
            this.ctx.arc(x, y, effectStrength * 1.6, 0, Math.PI * 2) // Etki alanını daha da genişlettik
            this.ctx.fill()

            this.ctx.globalCompositeOperation = 'destination-in'
            this.ctx.drawImage(this.shirtMask, 0, 0, this.$refs.wrinkleCanvas.width, this.$refs.wrinkleCanvas.height)
            this.ctx.globalCompositeOperation = 'source-over'

            this.checkWinCondition()
        },

        addBurnMark(x, y) {
            this.ctx.globalCompositeOperation = 'source-over'
            const burnGradient = this.ctx.createRadialGradient(x, y, 0, x, y, 30)
            burnGradient.addColorStop(0, 'rgba(139, 69, 19, 0.8)')
            burnGradient.addColorStop(1, 'rgba(139, 69, 19, 0)')

            this.ctx.fillStyle = burnGradient
            this.ctx.beginPath()
            this.ctx.arc(x, y, 30, 0, Math.PI * 2)
            this.ctx.fill()
        },

        createWrinkles() {
            const createNaturalWrinkle = (startX, startY, length, intensity) => {
                this.ctx.beginPath()
                this.ctx.moveTo(startX, startY)

                let x = startX
                let y = startY
                let angle = Math.random() * Math.PI * 2

                for (let i = 0; i < length; i += 2) {
                    angle += (Math.random() - 0.5) * 0.5
                    x += Math.cos(angle) * 2
                    y += Math.sin(angle) * 2

                    const wave = Math.sin(i * 0.1) * intensity
                    this.ctx.lineTo(x + wave, y + wave)
                }

                this.ctx.strokeStyle = 'rgba(70, 70, 70, 0.7)'
                this.ctx.lineWidth = 1.5 + Math.random() * 0.5
                this.ctx.stroke()
            }

            const gridSize = 60
            for (let x = 0; x < this.$refs.wrinkleCanvas.width; x += gridSize) {
                for (let y = 0; y < this.$refs.wrinkleCanvas.height; y += gridSize) {
                    const wrinkleCount = Math.floor(Math.random() * 3) + 2

                    for (let i = 0; i < wrinkleCount; i++) {
                        const startX = x + Math.random() * gridSize
                        const startY = y + Math.random() * gridSize
                        const length = 15 + Math.random() * 25
                        const intensity = 2 + Math.random() * 2

                        createNaturalWrinkle(startX, startY, length, intensity)
                    }
                }
            }

            this.ctx.globalCompositeOperation = 'destination-in'
            this.ctx.drawImage(this.shirtMask, 0, 0, this.$refs.wrinkleCanvas.width, this.$refs.wrinkleCanvas.height)
            this.ctx.globalCompositeOperation = 'source-over'
        },

        checkWinCondition() {
            if (this.gameOver) return

            const imageData = this.ctx.getImageData(0, 0, this.$refs.wrinkleCanvas.width, this.$refs.wrinkleCanvas.height)
            const pixels = imageData.data
            let totalAlpha = 0

            for (let i = 3; i < pixels.length; i += 4) {
                totalAlpha += pixels[i]
            }

            if (totalAlpha < this.initialTotalAlpha * 0.05) {
                this.gameOver = true
                this.burned = false
                setTimeout(this.resetGame, 3000)
            }
        },

        resetGame() {
            this.ironHeat = 0;
            this.gameOver = false;
            this.isIroning = false;
            this.consecutiveChecks = 0;
            this.warningBlink = false;
            this.burned = false;
            this.steamParticles = [];

            // Canvas'ı temizle ve yeni kırışıklıklar oluştur
            if (this.ctx && this.$refs.wrinkleCanvas) {
                this.ctx.clearRect(0, 0, this.$refs.wrinkleCanvas.width, this.$refs.wrinkleCanvas.height);
                if (this.shirtMask && this.shirtMask.complete) {
                    this.createWrinkles();
                }
            }

            // Steam canvas'ı temizle
            if (this.steamCtx && this.$refs.steamCanvas) {
                this.steamCtx.clearRect(0, 0, this.$refs.steamCanvas.width, this.$refs.steamCanvas.height);
            }

            // Isı göstergesini sıfırla
            const heatIndicator = document.getElementById('heat-indicator');
            if (heatIndicator) {
                heatIndicator.style.height = '0%';
                heatIndicator.style.backgroundColor = '';
            }

            // Başlangıç kırışıklık sayısını kaydet
            this.initialTotalAlpha = this.calculateRemainingWrinkles();
        },

        gameLoop() {
            if (!this.gameOver) {
                // Her frame'de değil, belirli aralıklarla ısı güncellemesi yap
                const currentTime = Date.now();
                if (currentTime - this.lastHeatUpdateTime > 100) { // 100ms'de bir güncelle
                    this.updateHeat();
                    this.lastHeatUpdateTime = currentTime;
                }

                // Oyun durumunu kontrol et
                if (this.isIroning && this.isInsideShirt(this.mouseX, this.mouseY)) {
                    this.removeWrinkles(this.mouseX, this.mouseY);
                    this.lastIronPosition = {
                        x: this.mouseX,
                        y: this.mouseY
                    };
                }

                // Her 5 frame'de bir buhar efektini güncelle
                if (this.frameCount % 5 === 0) {
                    this.updateAndDrawSteam();
                }
                this.frameCount = (this.frameCount + 1) % 60;

                // Her saniyede bir oyun durumunu kontrol et
                if (currentTime - this.lastGameCheckTime > 1000) {
                    this.checkGameOver();
                    this.lastGameCheckTime = currentTime;
                }
            }
            requestAnimationFrame(this.gameLoop);
        },

        updateMaterialCounts() {
            const selectedMaterials =
                this.materialsNeeded[this.createrMenu.selectedClothes]?.[
                this.createrMenu.selectedColor
                ] || [];
            const counts = {};
            selectedMaterials.forEach((material) => {
                const item = this.playerInventory.find(
                    (inventoryItem) => inventoryItem.name === material.item
                );
                counts[material.item] = item ? item.amount : 0;
            });
            this.materialCounts = counts;
        },

        resetFoldMinigame() {
            // Draggable öğeleri başlangıç durumuna döndür
            $('.draggable').each(function () {
                $(this).removeAttr('style'); // Tüm inline stilleri kaldır
                $(this).show(); // Display'i tekrar görünür yap
            });

            // foldStep ve diğer durum değişkenlerini sıfırla
            this.foldStep = 0;
            this.foldClothesData.count = 0;
        },

        initializeDraggable() {
            const self = this;

            // Draggable yapılandırması
            $('.draggable').draggable({
                revert: 'invalid', // Doğru yere bırakılmazsa geri dön
                start(event, ui) {
                    $(this).css('z-index', 1000); // Sürüklenen eleman üstte olsun
                },
                stop(event, ui) {
                    const $this = $(this);

                    // Eğer doğru yere bırakılmadıysa style değerlerini sil
                    if (!$this.hasClass('ui-dropped')) {
                        $this.removeAttr('style'); // Inline style'ları temizle
                    }


                    $this.removeClass('ui-dropped'); // Dropped class'ını temizle
                    $this.css('z-index', 99);
                },
            });

            // Drop alanı yapılandırması
            $(this.$refs.foldPart4).droppable({
                accept: '.draggable',
                drop(event, ui) {
                    const draggedElement = ui.helper[0].classList[0];

                    // Doğru adım mı kontrol et
                    const isValid = self.handleFold(draggedElement);

                    if (isValid) {
                        $(ui.helper).hide(); // Doğru adım tamamlandıysa gizle
                        ui.helper.addClass('ui-dropped'); // Doğru yere bırakıldığını işaretle
                    } else {
                        // Yanlış adımda style değerlerini temizle
                        const $this = $(ui.helper);
                        $this.removeAttr('style'); // Inline style'ları kaldır
                    }
                },
            });
        },

        handleFold(part) {
            if (this.foldStep === 0 && (part === 'foldPart1' || part === 'foldPart1S')) {
                this.foldStep++;
                this.foldClothesData.count = 1; // Sağ kol katlandı
            } else if (this.foldStep === 0 && (part === 'foldPart2' || part === 'foldPart2S')) {
                this.foldStep++;
                this.foldClothesData.count = 2; // Sol kol katlandı
            } else if (this.foldStep === 1 && (part === 'foldPart1' || part === 'foldPart1S') && this.foldClothesData.count === 2) {
                this.foldStep++;
                this.foldClothesData.count = 3; // Sağ kol da katlandı
            } else if (this.foldStep === 1 && (part === 'foldPart2' || part === 'foldPart2S') && this.foldClothesData.count === 1) {
                this.foldStep++;
                this.foldClothesData.count = 3; // Sol kol da katlandı
            } else if (this.foldStep === 2 && part === 'foldPart3') {
                this.foldStep++;
                this.foldClothesData.count = 4; // Tişört tam katlandı

                // 1 saniye sonra menüyü kapat ve sıfırla
                setTimeout(() => {
                    this.foldMenuShow = false;
                    postNUI('closeFoldMenu', this.foldData);
                    this.resetFoldMinigame(); // Minigame'i sıfırla
                }, 1000);
            } else {
                return false;
            }
            return true;
        },


        selectDress(dress) {
            if (this.createrMenu.selectedClothes == dress) return;
            this.createrMenu.selectedClothes = dress;
            if (this.allClothesAmount && this.allClothesAmount[this.createrMenu.selectedClothes] && this.allClothesAmount[this.createrMenu.selectedClothes][this.createrMenu.selectedColor]) {
                this.createrMenu.count = this.allClothesAmount[this.createrMenu.selectedClothes][this.createrMenu.selectedColor];
            } else {
                this.createrMenu.count = 0;
            }
        },
        selectColor(color) {
            if (this.createrMenu.selectedColor == color) return;
            this.createrMenu.selectedColor = color;
            if (this.allClothesAmount && this.allClothesAmount[this.createrMenu.selectedClothes] && this.allClothesAmount[this.createrMenu.selectedClothes][this.createrMenu.selectedColor]) {
                this.createrMenu.count = this.allClothesAmount[this.createrMenu.selectedClothes][this.createrMenu.selectedColor];
            } else {
                this.createrMenu.count = 0;
            }
        },
        produceClothes() {
            const validateInputs = () => {
                if (!this.createrMenu.logo) {
                    const errMsg = this.Locales['selectLogo'];
                    this.notifications.push({
                        message: errMsg,
                        type: 'errorNotify'
                    });
                    return errMsg;
                }

                if (!this.createrMenu.isLogoDroppedCorrectly) {
                    const errMsg = this.Locales['corretmove']; // İsimlendirmeyi kontrol edin
                    this.notifications.push({
                        message: errMsg,
                        type: 'errorNotify'
                    });
                    return errMsg;
                }

                if (!this.createrMenu.count || this.createrMenu.count < 1) {
                    const errMsg = this.Locales['invalidcount'];
                    this.notifications.push({
                        message: errMsg,
                        type: 'errorNotify'
                    });
                    return errMsg;
                }

                if (!this.createrMenu.selectedColor) {
                    const errMsg = this.Locales['invalidcolor'];
                    this.notifications.push({
                        message: errMsg,
                        type: 'errorNotify'
                    });
                    return errMsg;
                }

                if (!this.createrMenu.selectedClothes) {
                    const errMsg = this.Locales['invalidclothes'];
                    this.notifications.push({
                        message: errMsg,
                        type: 'errorNotify'
                    });
                    return errMsg;
                }

                // Daha önce aynı kategori ve renkte üretim yapıldıysa üretimi engelle
                const currentJob = this.progressData.regionJobTask.find(job => job.jobName === this.createrMenu.selectedClothes);
                if (currentJob && currentJob.madeAmount[this.createrMenu.selectedColor] > 0) {
                    const errMsg = this.Locales['alreadymade'] + " " + this.createrMenu.selectedColor;
                    this.notifications.push({
                        message: errMsg,
                        type: 'errorNotify'
                    });
                    return errMsg;
                }

                // Hata yoksa null döndür
                return null;
            };

            const errorMessage = validateInputs();
            if (errorMessage) {
                // console.log(errorMessage);
                return;
            }


            const selectedMaterials = this.materialsNeeded[this.createrMenu.selectedClothes]?.[this.createrMenu.selectedColor];
            if (!selectedMaterials) {
                return;
            }

            let missingMaterials = [];
            selectedMaterials.forEach((material) => {
                const inventoryItem = this.playerInventory.find((item) => item.name === material.item);
                const availableAmount = inventoryItem ? inventoryItem.amount : 0;

                if (availableAmount < material.count * this.createrMenu.count) {
                    missingMaterials.push({
                        label: material.label,
                        item: material.item,
                        required: material.count * this.createrMenu.count,
                        available: availableAmount,
                        error: true,

                    });
                } else {
                    missingMaterials.push({
                        label: material.label,
                        item: material.item,
                        required: material.count * this.createrMenu.count,
                        available: availableAmount,
                        error: false,
                    });
                }
            });


            if (missingMaterials.length > 0 && missingMaterials.some(material => material.error)) {
                //this.notifications.push({
                //    message: this.Locales['notenoughmaterials'],
                //    type: 'errorNotify'
                //})


                missingMaterials.forEach((material) => {
                    if (material.error) {
                        this.notifications.push({
                            message: `${material.label}: ${material.available}/${material.required}`,
                            type: 'errorNotify'
                        })
                    }
                });
                postNUI('setWaypoint')
                return;
            }

            const produceData = {
                logo: this.createrMenu.logo,
                count: this.createrMenu.count,
                color: this.createrMenu.selectedColor,
                clothes: this.createrMenu.selectedClothes,
                width: this.createrMenu.Width,
                height: this.createrMenu.Height,
                missingMaterials: missingMaterials,
            };
            postNUI("produceClothes", produceData);


            setTimeout(() => {
                this.createMenuShow = false;
                postNUI("closeMachineNUI");
                this.resetCreaterMenu();
            }, 0);
        },
        resetCreaterMenu() {
            this.createrMenu = {
                logo: '',
                count: '',
                selectedColor: 'darkblue',
                selectedClothes: 'tshirtcraft',
                isLogoDroppedCorrectly: false,
                createdImage: false
            };
            $('.logoIMG').remove();
        },

        setLogo() {
            if ($('.logoIMG').length > 0) {
                this.notifications.push({
                    message: this.Locales['alreadylogo'],
                    type: 'errorNotify'
                })
                return;
            }
            const logoUrl = $('.logoInput').val();

            if (this.createrMenu.logo.length === 0) return;
            const validExtensions = /\.(png|jpg|jpeg)$/i;
            try {
                const url = new URL(this.createrMenu.logo);
                if (!validExtensions.test(url.pathname)) {
                    this.notifications.push({
                        message: this.Locales['invalidfiletype'],
                        type: 'errorNotify'
                    })
                    return;
                }

            } catch (e) {
                this.notifications.push({
                    message: this.Locales['invalidurlformat'],
                    type: 'errorNotify'
                })
                return;
            }


            if (logoUrl) {
                this.createrMenu.createdImage = true;
                // Girilen URL'deki resmin boyutlarını alıp, ilgili veriye atıyoruz
                const tempImg = new Image();
                tempImg.onload = () => {
                    this.createrMenu.Width = tempImg.naturalWidth;
                    this.createrMenu.Height = tempImg.naturalHeight;
                };
                tempImg.onerror = () => {
                    this.notifications.push({
                        message: this.Locales['invalidurlformat'],
                        type: 'errorNotify'
                    })
                };

                tempImg.src = logoUrl;

                const randomTop = Math.floor(Math.random() * 50) + 10;
                const randomLeft = Math.floor(Math.random() * 70) + 10;

                const logo = $('<div class="logoIMG"></div>');
                const img = $('<img />').attr('src', logoUrl).css({
                    width: '100%',
                    height: '100%',
                    objectFit: 'cover',
                });

                logo.css({
                    top: randomTop + '%',
                    left: randomLeft + '%',
                });

                logo.append(img);
                $('.shirtBox').append(logo);

                // Logoyu draggable yap
                logo.draggable({
                    revert: 'invalid',
                    containment: '.shirtBox', // Logo'nun shirtBox içinde kalmasını sağlar
                    scroll: false, // Sayfa kaydırmasını engeller
                    drag: function (event, ui) {
                        // Logo'nun shirtBox sınırları içinde kalmasını sağla
                        const shirtBox = $('.shirtBox');
                        const shirtBoxPos = shirtBox.offset();
                        const shirtBoxWidth = shirtBox.width();
                        const shirtBoxHeight = shirtBox.height();
                        const logoWidth = $(this).width();
                        const logoHeight = $(this).height();

                        // Minimum ve maximum pozisyonları hesapla
                        const minLeft = 0;
                        const maxLeft = shirtBoxWidth - logoWidth;
                        const minTop = 0;
                        const maxTop = shirtBoxHeight - logoHeight;

                        // Pozisyonu sınırlar içinde tut
                        ui.position.left = Math.min(Math.max(ui.position.left, minLeft), maxLeft);
                        ui.position.top = Math.min(Math.max(ui.position.top, minTop), maxTop);
                    }
                });
            } else {
                this.notifications.push({
                    message: this.Locales['invalidurlformat'],
                    type: 'errorNotify'
                })
            }
            // clicksound("click.wav");
            // postNUI("setLogo", { logo: this.logoInputUrl });

        },

        selectLogo(valuee) {
            if ($('.logoIMG').length > 0) {
                this.notifications.push({
                    message: this.Locales['alreadylogo'],
                    type: 'errorNotify'
                })
                return;
            }


            // Seçilen logo URL'sini kaydediyoruz
            this.createrMenu.logo = valuee;


            if (this.createrMenu.logo.length === 0) return;
            const validExtensions = /\.(png|jpg|jpeg)$/i;
            try {
                const url = new URL(this.createrMenu.logo);
                if (!validExtensions.test(url.pathname)) {
                    this.notifications.push({
                        message: this.Locales['invalidfiletype'],
                        type: 'errorNotify'
                    })
                    return;
                }

            } catch (e) {
                this.notifications.push({
                    message: this.Locales['invalidurlformat'],
                    type: 'errorNotify'
                })
                return;
            }

            if (this.createrMenu.logo) {
                this.createrMenu.createdImage = true;
                // Resmin gerçek boyutlarını alıyoruz
                const tempImg = new Image();
                tempImg.onload = () => {
                    // Resim yüklendikten sonra gerçek genişlik ve yükseklik değerlerini kaydediyoruz
                    this.createrMenu.Width = tempImg.naturalWidth;
                    this.createrMenu.Height = tempImg.naturalHeight;
                };
                tempImg.onerror = () => {
                    this.notifications.push({
                        message: this.Locales['invalidurlformat'],
                        type: 'errorNotify'
                    })
                };
                tempImg.src = this.createrMenu.logo;

                // Rastgele konumlama değerleri
                const randomTop = Math.floor(Math.random() * 50) + 10;
                const randomLeft = Math.floor(Math.random() * 70) + 10;

                // Logo kapsayıcısını oluşturuyoruz
                const logo = $('<div class="logoIMG"></div>');
                const img = $('<img />').attr('src', this.createrMenu.logo).css({
                    width: '100%',
                    height: '100%',
                    objectFit: 'cover',
                });

                logo.css({
                    top: randomTop + '%',
                    left: randomLeft + '%',
                });

                logo.append(img);
                $('.shirtBox').append(logo);

                // Logoyu draggable yapıyoruz
                logo.draggable({
                    revert: 'invalid',
                    containment: '.shirtBox', // Logo'nun shirtBox içinde kalmasını sağlar
                    scroll: false, // Sayfa kaydırmasını engeller
                    drag: function (event, ui) {
                        // Logo'nun shirtBox sınırları içinde kalmasını sağla
                        const shirtBox = $('.shirtBox');
                        const shirtBoxPos = shirtBox.offset();
                        const shirtBoxWidth = shirtBox.width();
                        const shirtBoxHeight = shirtBox.height();
                        const logoWidth = $(this).width();
                        const logoHeight = $(this).height();

                        // Minimum ve maximum pozisyonları hesapla
                        const minLeft = 0;
                        const maxLeft = shirtBoxWidth - logoWidth;
                        const minTop = 0;
                        const maxTop = shirtBoxHeight - logoHeight;

                        // Pozisyonu sınırlar içinde tut
                        ui.position.left = Math.min(Math.max(ui.position.left, minLeft), maxLeft);
                        ui.position.top = Math.min(Math.max(ui.position.top, minTop), maxTop);
                    }
                });
            } else {
                this.notifications.push({
                    message: this.Locales['invalidurlformat'],
                    type: 'errorNotify'
                })
            }
        },
        deleteLogo() {
            $('.logoIMG').remove();
            this.createrMenu.isLogoDroppedCorrectly = false;
            this.createrMenu.createdImage = false;
            this.createrMenu.logo = '';
            this.createrMenu.Width = 0;
            this.createrMenu.Height = 0;
        },
        formatNumber(number) {
            if (number == null) return 0;
            return number.toLocaleString("tr-TR");
        },
        InvitePlayer(key) {
            if (this.inviteModal.length == 0) return;
            if (this.inviteModal < 1) return;
            clicksound("click.wav");
            this.invitePlayer[key] = !this.invitePlayer[key];
            postNUI("invitePlayer", { targetID: this.inviteModal, key: key });

            this.inviteModal = "";
        },

        openInvitePlayer(indentifier, key) {
            const index = this.playerListData.findIndex(x => x.playerIdentifier == indentifier);
            if (index == -1) return;
            if (this.playerListData[index].playerOwner) {
                this.invitePlayer[key] = !this.invitePlayer[key];
            }
            for (let i = 1; i <= 4; i++) {
                if (i != key) {
                    this.invitePlayer[i] = false;
                }
            }
        },
        firePlayer(identifier, key) {
            if (identifier == null) return;
            if (identifier == this.playerData.playerIdentifier) return;

            const index = this.playerListData.findIndex(x => x.playerIdentifier == identifier);
            const owner = this.playerListData.findIndex(x => x.playerOwner == true);
            if (this.playerListData[index].playerIdentifier === this.playerListData[owner].playerIdentifier) {
                clicksound("errorclick.mp3");
                return;
            }
            if (index == -1) return;
            if (this.playerListData[owner].playerOwner) {
                clicksound("click.wav");

                postNUI("firePlayer", {
                    lobbyID: this.playerListData[owner].playerIdentifier,
                    identifier: identifier,
                    targetID: this.playerListData[index].source
                });
            }
        },
        declineInvite() {
            this.requestMenuShow = false;
            clicksound("errorclick.mp3");
            this.closeNUI();
        },
        acceptInvite() {
            this.requestMenuShow = false;
            clicksound("click.wav");
            postNUI("acceptInvite", {
                hostIdentifier: this.requstData["hostIdentifier"]
            });
        },
        selectMission(regionData, regionKey) {
            if (regionData == null) return;
            if (regionKey == null) return;
            if (this.playerData.playerIdentifier == null) return;
            const identifierData = this.playerListData.findIndex(x => x.playerIdentifier == this.playerData.playerIdentifier);
            const playerOwner = this.playerListData.findIndex(x => x.playerOwner == true);
            if (this.playerListData[identifierData].playerIdentifier === this.playerListData[playerOwner].playerIdentifier) {
                if (this.selectRegionData != false && this.selectRegionData != null) {
                    if (regionKey == this.selectRegionData.regionKey) {
                        clicksound("click.wav");
                        postNUI("selectMission", false);
                        return;
                    }
                }

                if (regionData && regionData.regionKey) {
                    const regionIndex = this.regionData.findIndex(x => x.regionKey == regionData.regionKey);

                    if (regionIndex == -1) return;
                    if (this.regionData[regionIndex].regionInfo.regionMinimumLevel > this.playerData.playerLevel) {
                        clicksound("errorclick.mp3");
                        return;
                    }
                    clicksound("click.wav");
                    postNUI("selectMission", this.regionData[regionIndex]);
                }
            }
        },
        startJob() {
            if (this.selectRegionData == false) {
                clicksound("errorclick.mp3");
                return;
            }
            if (this.selectRegionData == null) {
                clicksound("errorclick.mp3");
                return;
            }
            if (this.jobStart) {
                clicksound("click.wav");
                postNUI("resetJob");
            } else {
                if (this.selectRegionData) {
                    clicksound("click.wav");
                    postNUI("startJob", this.selectRegionData);
                }
            }
        },
        startProgress(label, time) {
            this.progressbarLabel = label;
            this.progressbar = 0;
            const duration = time * 1000; // toplam süre milisaniye cinsinden
            let startTime = null;

            const animate = (timestamp) => {
                if (!startTime) startTime = timestamp;
                const elapsed = timestamp - startTime;
                this.progressbar = Math.min((elapsed / duration) * 100, 100);

                if (elapsed < duration) {
                    requestAnimationFrame(animate);
                } else {
                    // Animasyon tamamlandıktan sonra
                    setTimeout(() => {
                        stopsound();
                        this.progressbar = 0;
                        this.progressbarLabel = "";
                    }, 100);
                }
            };

            requestAnimationFrame(animate);
        },
        taskPercentage(task) {
            if (!task.totalAmount) return 0;
            let percentage = (task.completedAmount / task.totalAmount) * 100;
            if (percentage > 100) {
                return 100;
            }
            return percentage;
        },
        buyLevel() {
            if (this.tebexreedemcode.length == 0) return;
            clicksound("click.wav");
            postNUI("buyLevel", { code: this.tebexreedemcode });

            this.tebexPopup = false;
            this.tebexreedemcode = "";
        },
        openLink() {
            window.invokeNative("openUrl", "https://tworst.tebex.io/");
        },
        keyHandler(event) {
            if (event.keyCode == 27) {
                this.closeNUI();
            }
        },
        closeNUI() {
            if (this.createMenuShow) {
                this.createMenuShow = false;
                postNUI("closeMachineNUI");
            } else if (this.marketMenuShow) {
                this.marketMenuShow = false;
                postNUI("closeMarketNUI");
            } else if (this.tutoMenuShow && !this.mainShow) {
                this.tutoMenuShow = false;
                postNUI("closeNUI");
            } else if (this.tutoMenuShow && this.mainShow) {
                this.tutoMenuShow = false;
            } else if (!this.foldMenuShow && !this.gameShow) {
                this.mainShow = false;
                this.tebexPopup = false;
                postNUI("closeNUI");
            }
        },
        calculateProgress(mission, complete) {
            return (mission / complete) * 100;
        },
        mergeData(sqlData, configData) {
            const mergedData = configData.map(mission => {
                const sqlMissionData = sqlData[mission.name];
                return {
                    ...mission,
                    complete: sqlMissionData ? sqlMissionData.complete : false,
                    currentCount: sqlMissionData ? sqlMissionData.count : 0,
                    progressbar: sqlMissionData ? this.calculateProgress(sqlMissionData.count, mission.count) : 0
                };
            });
            this.totalCompleted = mergedData.filter(mission => mission.complete).length;
            this.playerDailyMission = mergedData;
        },

        initializeDroppable() {
            const self = this; // Vue instance
            $(".shirtDot").droppable({
                accept: ".logoIMG",
                containment: ".shirtBox",
                drop: function (event, ui) {
                    const $shirtDot = $(this);
                    const shirtDotOffset = $shirtDot.offset();
                    const shirtBoxOffset = $(".shirtBox").offset();
                    const shirtDotWidth = $shirtDot.outerWidth();
                    const shirtDotHeight = $shirtDot.outerHeight();
                    const logoWidth = ui.draggable.outerWidth();
                    const logoHeight = ui.draggable.outerHeight();

                    ui.draggable.css({
                        top: shirtDotOffset.top - shirtBoxOffset.top + (shirtDotHeight / 2) - (logoHeight / 2) + "px",
                        left: shirtDotOffset.left - shirtBoxOffset.left + (shirtDotWidth / 2) - (logoWidth / 2) + "px",
                    });

                    self.createrMenu.isLogoDroppedCorrectly = true;
                },
            });
        },


        getTargetStyle(index) {
            if (!this.targetEntities[index]) {
                return { display: 'none' }
            }

            const entity = this.targetEntities[index]
            const translateY = 50 - (entity.scale * 50)

            return {
                display: 'flex',
                left: `${entity.x * window.innerWidth}px`,
                bottom: `${window.innerHeight - (entity.y * window.innerHeight)}px`,
                transform: `translateX(-50%) translateY(${translateY}%) scale(${entity.scale})`
            }
        },

        startProgress2() {
            this.progress.isActive = true
            const circumference = Math.PI * 2 * 45
            const remainingDuration = (this.progress.currentOffset / circumference) * this.progress.duration

            let startTime = null
            const animate = (currentTime) => {
                if (!startTime) startTime = currentTime
                const elapsed = currentTime - startTime

                const progress = Math.min(elapsed / remainingDuration, 1)
                this.progress.currentOffset = circumference * (1 - progress)

                if (progress < 1) {
                    this.progress.animation = requestAnimationFrame(animate)
                } else {
                    this.progressComplete()
                }
            }

            this.progress.animation = requestAnimationFrame(animate)
        },

        stopProgress() {
            this.progress.isActive = false
            if (this.progress.animation) {
                cancelAnimationFrame(this.progress.animation)
                this.progress.animation = null
            }
        },

        resetProgress() {
            this.stopProgress()
            this.progress.currentOffset = Math.PI * 2 * 45
        },

        progressComplete() {
            this.resetProgress()
            postNUI("progressSuccess", {
                entity: this.buttonInteractionId,
                id: this.displayInteractionId,
                type: this.typeInteraction,
                index: this.indexInteraction
            });
        },

        updateItemAmount(item, amount) {
            if (item.amount + amount < 0) {
                return;
            }
            item.amount += amount;
        },
        onInputChange(item) {
            // Elle girilen değeri kontrol et
            if (item.amount < 0) {
                item.amount = 0; // Minimum değeri 0 olarak sınırla
            }
        },
        buyItem(item) {
            if (item.amount == 0) {
                clicksound("errorclick.mp3");
                this.notifications.push({
                    message: this.Locales['itemamountis0'],
                    type: 'errorNotify'
                })
                return;

            }

            if (this.playerData.playerMoney < item.price * item.amount) {
                clicksound("errorclick.mp3");
                this.notifications.push({
                    message: this.Locales['notenoughmoney'],
                    type: 'errorNotify'
                })
                return;
            }


            this.playerData.playerMoney -= item.price * item.amount;
            postNUI("buyItem", item);
            item.amount = 0;
            clicksound("click.wav");
        },
        startTutorial(tutorialName) {
            this.screenTuto = true;
            this.tutorialName = tutorialName;

            // Dosya yolunu mp4 olarak güncelledik
            getMp4Duration(`./img/tutorial/${tutorialName}.mp4`)
                .then(duration => {
                    this.tutorialDuration = duration;
                    setTimeout(() => {
                        // Tutorial süresi dolduğunda ekranı kapatıyoruz
                        this.screenTuto = false;
                        // Kuyrukta bekleyen varsa sıradakini başlatıyoruz
                        if (this.tutorialQueue.length > 0) {
                            const nextTutorial = this.tutorialQueue.shift();
                            this.startTutorial(nextTutorial);
                        }
                    }, this.tutorialDuration);
                })
                .catch(err => {
                    console.error(err);
                    this.screenTuto = false;
                    if (this.tutorialQueue.length > 0) {
                        const nextTutorial = this.tutorialQueue.shift();
                        this.startTutorial(nextTutorial);
                    }
                });
        },
        eventHandler(event) {
            switch (event.data.action) {
                case "CHECK_NUI":

                    postNUI("checkNUI");
                    break;
                case "OPEN_MENU":
                    this.mainShow = true;
                    this.playerData = event.data.payload;
                    this.mergeData(this.playerData.dailymission, this.dailyMission);
                    break;
                case "OPEN_CREATE_MENU":
                    this.createMenuShow = true;
                    this.playerData = event.data.payload;
                    break;
                case "OPEN_MARKET_MENU":
                    this.marketMenuShow = true;
                    this.playerData = event.data.payload;
                    this.marketItems.forEach(item => {
                        item.amount = 0;
                    });

                    break;
                case "OPEN_TUTORIAL":
                    this.tutoMenuShow = true;
                    this.tutorialList.forEach(item => {
                        item.isOpen = false;
                    });
                    break;
                case "OPEN_FOLD_MENU":
                    if (this.gameShow) {
                        return;
                    }

                    this.foldStep = 0;
                    this.foldData = event.data.payload;
                    this.foldClothesData.selectedColor = event.data.payload.color;
                    this.foldClothesData.selectedClothes = event.data.payload.clothes;
                    this.foldClothesData.selectedLogo = event.data.payload.logo;
                    this.foldClothesData.count = 0;
                    this.foldMenuShow = true;

                    if (this.devMode) {
                        setTimeout(() => {
                            this.foldMenuShow = false;
                            postNUI('closeFoldMenu', this.foldData);
                        }, 1500);
                    }
                    break;
                case "OPEN_MINIGAME":
                    if (this.foldMenuShow) {
                        return;
                    }

                    this.foldData = event.data.payload;
                    this.foldClothesData.selectedColor = event.data.payload.color;
                    this.foldClothesData.selectedClothes = event.data.payload.clothes;
                    this.foldClothesData.selectedLogo = event.data.payload.logo;
                    this.foldClothesData.count = 0;

                    this.resetGame(); // Önce oyunu sıfırla
                    this.initializeGame(); // Sonra yeni oyunu başlat
                    this.gameShow = true;

                    if (this.devMode) {
                        setTimeout(() => {
                            this.resetGame();
                            this.gameShow = false;
                            postNUI('closeGame', { success: true, foldData: this.foldData });
                        }, 1500);
                    }
                    break;
                case "LOAD_LOBBY":
                    this.playerListData = event.data.payload;
                    break;
                case "SERVER_NAME":
                    this.serverName = event.data.payload;
                    break;
                case "SERVER_MONEY_TYPE":
                    this.moneyType = event.data.payload;
                    break;
                case "REGION_DATA":
                    this.regionData = event.data.payload;
                    break;
                case "LOCALES":
                    this.Locales = event.data.payload;
                    break;
                case "INVITE_MENU":
                    if (this.mainShow) {
                        this.mainShow = false;
                        this.selectRegionData = false;
                        this.playerData = false;
                        this.playerListData = [];
                    }
                    this.requestMenuShow = true;
                    this.requstData["hostName"] = event.data.payload.lobbyOwner;
                    this.requstData["hostIdentifier"] = event.data.payload.identifier;
                    break;
                case "REFRESH_LOBBY":
                    if (event.data.payload === false) {
                        this.selectRegionData = false;
                    } else {
                        this.selectRegionData = event.data.payload;
                    }
                    break;
                case "CLOSENUI":
                    this.mainShow = false;
                    this.finishShow = false;
                    this.requestMenuShow = false;
                    this.selectRegionData = false;
                    this.playerData = false;
                    this.playerListData = [];
                    break;
                case "START_JOB": {
                    // Ekran gösterim ayarları
                    this.mainShow = false;
                    this.playerShow = true;
                    this.scoreBoxShow = true;
                    this.jobStart = true;
                    this.progressData = event.data.payload;
                    // Gelen verileri işleme
                    const progressData = event.data.payload;
                    if (!progressData || !progressData.regionJobTask) {
                        break;
                    }

                    this.progressData = progressData;
                    this.allClothesAmount = {};
                    this.materialsNeeded = {};

                    const jobCategories = [
                        { jobName: "tshirtcraft", category: "tshirtcraft" },
                        { jobName: "sweatercraft", category: "sweatercraft" }
                    ];

                    jobCategories.forEach(({ jobName, category }) => {
                        const jobData = progressData.regionJobTask.find(task => task.jobName === jobName);

                        if (!jobData) {
                            return;
                        }

                        const { jobCount, madeAmount = {}, materialsNeeded = [] } = jobData;
                        this.allClothesAmount[category] = {};
                        this.materialsNeeded[category] = {};

                        Object.entries(jobCount).forEach(([color, required]) => {
                            const made = madeAmount[color] || 0;
                            const remaining = Math.max(0, required - made);
                            this.allClothesAmount[category][color] = remaining;

                            // Sadece ilgili renge ait boya ve secondItem true olan malzemeleri ekle
                            const colorMaterial = materialsNeeded.find(material => material.color === color);
                            const secondaryMaterials = materialsNeeded.filter(material => material.secondItem === true);

                            if (!colorMaterial) {
                                //console.log(`Missing color-specific material for color: ${color}.`);
                                return;
                            }

                            this.materialsNeeded[category][color] = [
                                { ...colorMaterial },
                                ...secondaryMaterials.map(material => ({ ...material }))
                            ];
                        });
                    });

                    // Seçilen kategori ve renk için sayımı güncelle
                    const selectedCategory = this.allClothesAmount?.[this.createrMenu.selectedClothes];
                    this.createrMenu.count = selectedCategory?.[this.createrMenu.selectedColor] || 0;

                    break;
                }

                case "REFRESH_JOBTASK":
                    this.progressData = event.data.payload;
                    this.allClothesAmount = this.allClothesAmount || {};

                    const refreshCategories = [
                        { jobName: "tshirtcraft", category: "tshirtcraft" },
                        { jobName: "sweatercraft", category: "sweatercraft" }
                    ];

                    refreshCategories.forEach(({ jobName, category }) => {
                        const fabricAmount = this.progressData.regionJobTask.find(task => task.jobName === jobName);

                        if (!fabricAmount) {
                            console.error(`${jobName} is undefined. Please check your payload.`);
                            return;
                        }

                        const { jobCount, madeAmount = {} } = fabricAmount;
                        this.allClothesAmount[category] = this.allClothesAmount[category] || {};

                        Object.entries(jobCount).forEach(([color, required]) => {
                            const made = madeAmount[color] || 0; // Eksikse 0 kabul et
                            const remaining = Math.max(0, required - made); // Eksik miktarı hesapla
                            this.allClothesAmount[category][color] = remaining;
                        });
                    });

                    const refreshSelectedCategory = this.allClothesAmount?.[this.createrMenu.selectedClothes];
                    this.createrMenu.count = refreshSelectedCategory?.[this.createrMenu.selectedColor] || 0;
                    break;
                case "NOTIFICATION":
                    this.notifications.push(event.data.payload);
                    this.notifyShow = true;
                    break;
                case "FINISH_JOB":
                    this.progressData = false;
                    this.scoreBoxShow = false;
                    this.playerShow = false;
                    this.selectRegionData = false;
                    this.finishShow = true;
                    this.finishjobData = event.data.payload;
                    setTimeout(() => {
                        this.finishShow = false;
                        this.finishjobData = false;
                    }, 5000);
                    this.jobStart = false;
                    break;
                case "showProgressBar":
                    this.startProgress(event.data.payload.label, event.data.payload.time);
                    break;
                case "RESET_JOB":
                    this.progressData = false;
                    this.scoreBoxShow = false;
                    this.playerShow = false;
                    this.selectRegionData = false;
                    this.finishShow = false;
                    this.finishjobData = false;
                    this.jobStart = false;
                    this.closeNUI();
                    break;
                case "DAILY_MISSION":
                    this.dailyMission = event.data.payload;
                    break;
                case "UPDATE_DISTANCE_HEIGHT":
                    this.distanceBoxShow = true;
                    this.distanceHeight = event.data.payload;
                    break;
                case "CLOSE_HEIGHT":
                    setTimeout(() => {
                        this.distanceBoxShow = false;
                    }, 3000);
                    break;
                case "TEBEX_ACCESS":
                    this.tebexSystem = event.data.payload;
                    break;
                case "DEV_MODE":
                    this.devMode = event.data.payload;
                    break;
                case "MARKET_ITEMS":
                    this.marketItems = event.data.payload.map(item => ({
                        ...item,
                        amount: 0
                    }));
                    break;
                case "TUTORIAL_LIST":
                    this.tutorialList = event.data.payload.map(item => ({
                        ...item,
                        isOpen: false
                    }));
                    break;
                case "DEFAULT_LOGO":
                    this.defaultLogoList = event.data.payload;
                    break;
                case "SET_INVENTORY":
                    this.playerInventory = event.data.payload;
                    break;
                case "PLAY_SOUND":
                    clicksound(event.data.payload);
                    break;
                case "updateTarget":
                    this.targetEntities = event.data.payload.display ? event.data.payload.entities : []
                    break;
                case "updateClosestTarget":
                    if (event.data.payload.display) {
                        if (event.data.payload.entity.id !== this.buttonInteractionId) {
                            this.buttonInteractionId = event.data.payload.entity.id
                            this.resetProgress()
                        }

                        this.progress.duration = event.data.payload.entity.option.duration
                        this.displayInteractionId = event.data.payload.entity.Display
                        this.typeInteraction = event.data.payload.entity.Type
                        this.indexInteraction = event.data.payload.entity.Index || null

                        this.currentEntity = event.data.payload.entity
                        this.optionVisible = true
                    } else {
                        this.resetProgress()
                        this.optionVisible = false
                    }
                    break;
                case "buttonClick":
                    this.startProgress2()
                    break;
                case "buttonReset":
                    this.resetProgress()
                    break;
                case "SET_TABLE_CENTER":
                    if (event.data.payload) {
                        setTimeout(() => {
                            this.tableCenterShow = true;
                        }, 400);
                    } else {
                        this.tableCenterShow = false;
                    }
                    break;
                case "SHOW_TUTORIAL":
                    const incomingTutorial = event.data.payload;

                    // Eğer ekran zaten gösteriliyorsa tutorial'ı kuyruğa ekle
                    if (this.screenTuto) {
                        this.tutorialQueue.push(incomingTutorial);
                        return;
                    }

                    // Aksi halde doğrudan tutorial'ı başlat
                    this.startTutorial(incomingTutorial);
                    break;

                default:
                    break;
            }
        },
    },
    computed: {
        optionStyle() {
            if (!this.currentEntity) return {}
            return {
                display: 'flex',
                left: `${this.currentEntity.x * window.innerWidth}px`,
                bottom: `${window.innerHeight - (this.currentEntity.y * window.innerHeight) + 50}px`,
                transform: 'translateX(-50%) translateY(0)'
            }
        },
        progressStyle() {
            const circumference = Math.PI * 2 * 45
            return {
                'stroke-dasharray': `${circumference}`,
                'stroke-dashoffset': `${this.progress.currentOffset}`
            }
        },
        buttonStyle() {
            return {
                transform: `translate(-50%, -50%) scale(${this.progress.isActive ? 0.85 : 1.0})`
            }
        },
        progressPercentage() {
            if (this.playerData.playerXp == null || this.playerData.playerNextXp == null) return 0;
            let percentage = (this.playerData.playerXp / this.playerData.playerNextXp) * 100;
            if (percentage > 100) {
                return 100;
            }
            return percentage;
        },
        requiredPercentage() {
            if (this.playerData.playerXp == null || this.playerData.playerNextXp == null) return 0;
            let percentage = (this.playerData.playerNextXp - this.playerData.playerXp)
            return percentage;
        },
        monthlyTaskPercentage() {
            if (this.monthlyTask == null) return 0;
            let total = 0;
            let completed = 0;
            this.monthlyTask.forEach(element => {
                total += element.totalAmount;
                if (element.taskDone) {
                    completed += element.completedAmount;
                }
            });

            let percentage = (completed / total) * 100;
            if (percentage > 100) {
                return 100;
            }
            return percentage;
        },
    }
});

app.use(store).mount("#app");
var resourceName = "tworst-textile";

if (window.GetParentResourceName) {
    resourceName = window.GetParentResourceName();
}

window.postNUI = async (name, data) => {
    try {
        const response = await fetch(`https://${resourceName}/${name}`, {
            method: "POST",
            mode: "cors",
            cache: "no-cache",
            credentials: "same-origin",
            headers: {
                "Content-Type": "application/json"
            },
            redirect: "follow",
            referrerPolicy: "no-referrer",
            body: JSON.stringify(data)
        });

        if (!response.ok) {
            return null;
        }

        const text = await response.text(); // Yanıtı önce metin olarak al
        if (!text) {
            return null;
        }

        try {
            return JSON.parse(text); // Metni JSON olarak ayrıştır
        } catch (error) {
            console.error("Geçersiz JSON formatı:", text);
            return null;
        }
    } catch (error) {
        // console.error("Fetch hatası:", error);
        return null;
    }
};

function clicksound(val) {
    let audioPath = `./sounds/${val}`;
    audioPlayer = new Howl({
        src: [audioPath]
    });
    audioPlayer.volume(0.4);
    audioPlayer.play();
}

function stopsound() {
    if (audioPlayer) {
        audioPlayer.stop();

    }
}


// Mp4 dosyasının süresini (milisaniye cinsinden) almak için bir fonksiyon
function getMp4Duration(url) {
    return new Promise((resolve, reject) => {
        const video = document.createElement('video');
        video.preload = 'metadata';
        video.src = url;

        // Bazı tarayıcılar autoplay ve ses politikaları nedeniyle hata verebileceği için videoyu sessize alabilirsiniz.
        video.muted = true;

        // Metadata yüklendiğinde video.duration (saniye cinsinden) hazır olur
        video.onloadedmetadata = function () {
            // Eğer video.src, URL.createObjectURL ile oluşturulduysa: URL.revokeObjectURL(video.src);
            const durationInMs = video.duration * 1000; // saniyeyi milisaniyeye çeviriyoruz
            resolve(durationInMs);
        };

        video.onerror = function (e) {
            reject(new Error("Video yüklenirken hata oluştu."));
        };
    });
}
