/***********************************************
 *                                             *
 * szPosteriorEyeCanvas.js                     *
 * -----------------------                     *
 * Created by Syukron Zahri                    *
 * Copyright (c) Syukron Zahri @ 2016          *
 * Copy is permitted without any modifications *
 *                                             *
 ***********************************************/

(function($){
    var backgroundImage = '<svg xmlns="http://www.w3.org/2000/svg" width="3200" height="1200" viewBox="0 0 3200 1200"><style>.a{fill:none;stroke-width:3;stroke:#16168b;}</style><g transform="matrix(3.8434698 0 0 3.8434698 22.87066 24.0884)"><circle cx="150.4" cy="149.9" r="139.3" class="a"/><circle cx="150.2" cy="149.8" r="149.3" class="a"/><circle cx="210" cy="150" r="10.4" class="a"/><path d="M61.1 128.6C112.2 85.9 149.8 92.4 167.4 95.1 185 97.7 205 110 207.2 140.4" class="a"/><path d="M197.9 112.9C180.4 80.4 169.3 72.4 141.4 57.1" class="a"/><path d="M94.4 106.3C89.5 96.7 65.6 93.7 65.6 93.7" class="a"/><path d="M63.2 172.7C114.3 215.4 157.6 206.2 171.3 202 185 197.8 207.2 180 206.6 159.3" class="a"/><path d="m160.4 204.7c-5.4 10.4-11.7 17.1-21.2 24.8-5.2 4.2-20.2 9.3-20.2 9.3" class="a"/><path d="m92.4 193c-5.9 10.6-34.9 14-34.9 14" class="a"/><path d="M213.7 139.3C222.3 130 225 127.6 236.3 120.7" class="a"/><path d="m213.7 160.7c4.3 4.7 13.6 15.8 23.1 18 8.6 2 23.2-1.3 26-5.5" class="a"/><path d="m212.7 161.1c2.4 5.9 5.3 13.4 9.9 19.7 4.6 6.3 11 11.3 14.1 15.6" class="a"/><path d="m235.7 121.9c1-14.3 1.3-18.1 2.5-28.7" class="a"/><path d="m233.9 120.5c12.2 2.2 16.1 2.8 32.2 4.5" class="a"/></g><g transform="matrix(-3.8434698 0 0 -3.8434698 3177.4678 1175.9116)"><circle cx="150.4" cy="149.9" r="139.3" class="a"/><circle cx="150.2" cy="149.8" r="149.3" class="a"/><circle cx="210" cy="150" r="10.4" class="a"/><path d="M61.1 128.6C112.2 85.9 149.8 92.4 167.4 95.1 185 97.7 205 110 207.2 140.4" class="a"/><path d="M197.9 112.9C180.4 80.4 169.3 72.4 141.4 57.1" class="a"/><path d="M94.4 106.3C89.5 96.7 65.6 93.7 65.6 93.7" class="a"/><path d="M63.2 172.7C114.3 215.4 157.6 206.2 171.3 202 185 197.8 207.2 180 206.6 159.3" class="a"/><path d="m160.4 204.7c-5.4 10.4-11.7 17.1-21.2 24.8-5.2 4.2-20.2 9.3-20.2 9.3" class="a"/><path d="m92.4 193c-5.9 10.6-34.9 14-34.9 14" class="a"/><path d="M213.7 139.3C222.3 130 225 127.6 236.3 120.7" class="a"/><path d="m213.7 160.7c4.3 4.7 13.6 15.8 23.1 18 8.6 2 23.2-1.3 26-5.5" class="a"/><path d="m212.7 161.1c2.4 5.9 5.3 13.4 9.9 19.7 4.6 6.3 11 11.3 14.1 15.6" class="a"/><path d="m235.7 121.9c1-14.3 1.3-18.1 2.5-28.7" class="a"/><path d="m233.9 120.5c12.2 2.2 16.1 2.8 32.2 4.5" class="a"/></g></svg>';
    
    var mode = 'drawPencil';
    
    var fillColor = '#000';
    var fillRadius = 1;
    
    var isDrawing = false;
    var isDragging = false;
    
    /*----------------------------------*/
    /*------- Internal functions -------*/
    /*----------------------------------*/
    
    /* Clear canvas */
    function clearCanvas(szCanvasObj)
    {
        var self = szCanvasObj;
        var context = self.canvas.getContext('2d');
        var cHeight = self.clientWidth / 2;
        var cWidth = self.clientWidth;
        
        context.clearRect(0, 0, cWidth, cHeight);
    }
    
    /* Draw background */    
    function exportImageToBase64(canvas)
    {
        return canvas.toDataURL();
    }
    
    function getCanvas(szCanvasObj)
    {
        return szCanvasObj.canvas;
    }

    var resizeEverything = function(szCanvasObj){
        var self = szCanvasObj;
        
        self.rTime = new Date();
        
        if (self.timeout === false) {
            self.timeout = true;
            setTimeout(function(){resizeCheck(self)}, self.delta);
        }
        resizeLayout(self);
    }
    
    /* Set whether the canvas is responsive to resize event */
    function setResponsive(szCanvasObj, state)
    {
        var self = szCanvasObj;
        
        if (state === true) {
            window.addEventListener('resize', function(){resizeEverything(self)}, false);
        } else {
            window.removeEventListener('resize', function(){resizeEverything(self)}, false);
        }
    }
    
    function paint(szCanvasObj)
    {
        var self = szCanvasObj;
        
        var context = self.canvas.getContext('2d');
        
        context.lineWidth = self.pointSize;
        context.strokeStyle = self.pointColor;
        context.lineJoin = 'round';
        context.lineCap = 'round';
        context.fillStyle = 'blue';
                
        switch (self.mode){
            case 'brush':
                context.globalCompositeOperation = 'source-over';
                break;
            case 'eraser':
                context.globalCompositeOperation = 'destination-out';
                break;
        }
        
        if (self.canDraw === true) {
            if (self.points.length < 2) {
                context.beginPath();
                context.lineWidth = self.pointSize / 2;
                context.arc(self.points[0].x + 1, self.points[0].y + 1, context.lineWidth / 2, 0, 2 * Math.PI, false);
                context.stroke();
            } else if (self.points.length < 3) {
                context.beginPath();
                context.moveTo(self.points[0].x, self.points[0].y);
                context.lineTo(self.points[1].x, self.points[1].y);
                context.stroke();
            } else if (self.points.length >= 3) {
                context.beginPath();
                context.moveTo(self.points[0].x, self.points[0].y);
                
                var i;
                
                for (i = 1; i < self.points.length - 2; i++) {
                    var c = (self.points[i].x + self.points[i + 1].x) / 2;
                    var d = (self.points[i].y + self.points[i + 1].y) / 2;
                    
                    context.quadraticCurveTo(self.points[i].x, self.points[i].y, c, d);
                }
                
                // For the last 2 points
                context.quadraticCurveTo(self.points[i].x, self.points[i].y, self.points[i + 1].x, self.points[i + 1].y);
                
                context.stroke();
            }
            
            if (self.points.length > 9) {
                self.points.splice(0, 1);
            }
        }
    };
    
    function insertText(szCanvasObj, coordinate)
    {
        var self = szCanvasObj;
        var context = self.canvas.getContext('2d');
        
        var wrapper = document.createElement('div');
        var textInput = wrapper.appendChild(document.createElement('input'));
        textInput.type = 'text';

        wrapper.style.position = 'absolute';
        wrapper.style.padding = '0px';
        wrapper.style.margin = '0px';
        wrapper.style.zIndex = 4;
        wrapper.style.display = 'inline-block';
        wrapper.style.whiteSpace = 'no-wrap';
        wrapper.style.top = coordinate.y + 'px';
        wrapper.style.left = coordinate.x + 'px';
        
        textInput.style.width = '100%';
        textInput.style.border = '1px dashed black';
        textInput.style.color = self.pointColor;
        textInput.style.backgroundColor = "rgba(255, 255, 255, 0)";
        textInput.size = 1;
        textInput.style.font = self.pointSize + 'px Arial';
        
        self.appendChild(wrapper);
        
        textInput.onkeypress = textInput.onkeydown = function(e){
            if (e.keyCode == 13) {
                e.preventDefault();
                mergeDownText(self, this, coordinate);
            } else if (e.keyCode == 27) {
                this.value = '';
                mergeDownText(self, this, coordinate);
            }
            
            this.size = (this.value.length > 0) ? this.value.length : 2;
        };
        
        textInput.onblur = function(e){
            mergeDownText(self, this, coordinate);
        }
        
        return textInput;
    }
    
    function mergeDownText(szCanvasObj, inputText, coordinate)
    {
        var self = szCanvasObj;
        var context = self.canvas.getContext('2d');
        var wrapper = inputText.parentNode;
        
        context.globalCompositeOperation = 'source-over';
        context.font = inputText.style.font;
        context.strokeStyle = self.pointColor;
        context.fillStyle = self.pointColor;
        
        context.fillText(inputText.value, coordinate.x + 1, coordinate.y + Number.parseInt(self.pointSize) - 3);
        inputText.parentNode.parentNode.removeChild(wrapper);
    }
    
    function storeImage(szCanvasObj)
    {
        var self = szCanvasObj;
        
        self.previousImage = exportImageToBase64(self.canvas);
        self.previousDimension.x = self.clientWidth;
        self.previousDimension.y = self.clientWidth / 2;
    }
    
    function resizeCheck(szCanvasObj)
    {
        var self = szCanvasObj;
        
        if (new Date() - self.rTime < self.delta) {
            setTimeout(function(){resizeCheck(self)}, self.delta);
        } else {
            self.timeout = false;
            resample(self);
        }
    }
    
    function resample(szCanvasObj)
    {
        var self = szCanvasObj;
        var context = self.canvas.getContext('2d');
        
        var img = new Image();
        var imaginaryCanvas = document.createElement('canvas');
        var imaginaryContext = imaginaryCanvas.getContext('2d');
        var imaginaryImage = new Image();
        
        var newHeight = self.clientHeight;
        var newWidth = self.clientWidth;
        
        imaginaryCanvas.setAttribute('height', self.previousDimension.y);
        imaginaryCanvas.setAttribute('width', self.previousDimension.x);
        
        imaginaryImage.crossOrigin = 'Anonymous';
        imaginaryImage.onload = function(){
            imaginaryContext.drawImage(imaginaryImage, 0, 0);
            
            var hermite = new Hermite_class();
            hermite.resample_single(imaginaryCanvas, newWidth, newHeight, true);
            
            var newImage = new Image();
            newImage.onload = function(){
                context.drawImage(newImage, 0, 0);
            };
            newImage.src = imaginaryCanvas.toDataURL();
        }
        
        imaginaryImage.src = self.previousImage;
    }
    
    function resizeLayout(szCanvasObj)
    {
        var self = szCanvasObj;
        
        var nHeight = (self.clientWidth / 2);
        var nWidth = self.clientWidth;
        var cHeight = nHeight + self.style.paddingTop;
        
        self.style.height = nHeight + 'px';
        self.container.style.height = cHeight;
        
        self.svg.setAttribute('height', nHeight);
        self.svg.setAttribute('width', nWidth);
        
        self.canvas.setAttribute('height', nHeight);
        self.canvas.setAttribute('width', nWidth);        
    }
    
    function setPointSize(szCanvasObj, size)
    {
        var self = szCanvasObj;
        self.pointSize = size;
        setCursor(self);
    }
    
    function getSelf(szCanvasObj)
    {
        return szCanvasObj;
    }
    
    function setMode(szCanvasObj, mode)
    {
        var self = szCanvasObj;
        self.mode = mode;
        setCursor(self);
    }

    function setColor(szCanvasObj, color)
    {
        var self = szCanvasObj;
        self.pointColor = color;
    }
    
    function setCursor(szCanvasObj)
    {
        var self = szCanvasObj;
        
        var cur = new szCursor();
        
        if (self.mode == 'disabled') {
            self.canvas.style.cursor = 'default';
        } else {
            cur.getCursorImage(self.mode, self.pointSize, function(base64Image){
                if (self.mode == 'text') {
                    self.canvas.style.cursor = 'url(' + base64Image + ') ' + (self.pointSize / 4).toString() + ' 0, auto';
                } else {
                    self.canvas.style.cursor = 'url(' + base64Image + ') ' + (self.pointSize / 2).toString() + ' ' + (self.pointSize / 2).toString() + ', auto';
                }
            });            
        }
    }
    
    function exportData(szCanvasObj)
    {
        var self = szCanvasObj;
        return {
            height: self.clientHeight,
            width: self.clientWidth,
            image: exportImageToBase64(self.canvas),
        }
    }
    
    function importData(szCanvasObj, data)
    {
        var self = szCanvasObj;
        
        self.previousImage = data.image;
        self.previousDimension.x = data.width
        self.previousDimension.y = data.height;
        
        resample(self);
    }
    
    /*-----------------------------------------*/
    /*------- End of Internal functions -------*/
    /*-----------------------------------------*/
    
    /* Public method */
    var methods = {
        init: function(szCanvasObj, options){
            var self = szCanvasObj;
            
            self.innerHTML = backgroundImage;
            self.svg = self.firstChild;
            self.canvas = self.appendChild(document.createElement('canvas'));
            self.container = self.parentElement;
            
            self.points = [];
            self.mouse = {x: 0, y: 0};

            self.childNodes.top = 0;
            self.childNodes.left = 0;
            
            self.svg.style.zIndex = 1;
            self.canvas.style.zIndex = 2;
            
            self.style.position = "relative";
            self.svg.style.position = "absolute";
            self.canvas.style.position = "absolute";
            self.canvas.style.border = "1px solid black";
            
            self.previousImage = undefined;
            self.previousDimension = {x: 0, y: 0};
            
            self.rTime = undefined;
            self.timeout = false;
            self.delta = 200;

            self.canDraw = true;
            self.isDrawing = false;

            self.pointSize = 2;
            self.mode = 'brush';
            self.pointColor = 'black';
            
            resizeLayout(self);

            if (typeof options === 'undefined') {
                return;
            }
            
            if (typeof options.canDraw === 'boolean') {
                self.canDraw = options.canDraw;
            }
            
            if (typeof options.mode !== 'undefined') {
                self.mode = options.mode;
            }
            
            setCursor(self);
            
            if (options.responsive === true) {
                setResponsive(self, true);
            } else {
                setResponsive(self, false);
            }
            
            self.canvas.addEventListener('mousemove', function(e){                
                if (typeof e.offsetX === 'undefined' && typeof e.offsetY === 'undefined') {
                    self.isDrawing = false;
                    self.points = [];
                    return;
                }
                
                self.mouse.x = typeof e.offsetX !== 'undefined' ? e.offsetX : e.layerX;
                self.mouse.y = typeof e.offsetY !== 'undefined' ? e.offsetY : e.layerY;
                
                if (self.isDrawing) {
                    self.points.push({x: self.mouse.x, y: self.mouse.y});
                    paint(self);
                }
            }, false);
            
            self.canvas.addEventListener('mousedown', function(e){
                self.mouse.x = typeof e.offsetX !== 'undefined' ? e.offsetX : e.layerX;
                self.mouse.y = typeof e.offsetY !== 'undefined' ? e.offsetY : e.layerY;
                
                if (self.mode == 'brush' || self.mode == 'eraser') {
                    self.isDrawing = true;
                    if (self.isDrawing) {
                        self.points.push({x: self.mouse.x, y: self.mouse.y});
                        paint(self);
                    }                    
                }
                
            }, false);
            
            self.canvas.addEventListener('mouseup', function(){
                self.isDrawing = false;
                self.points = [];
                
                if (self.mode == 'text') {
                    var inputText = insertText(self, {x: self.mouse.x, y: self.mouse.y});
                    inputText.focus();
                }
                
                storeImage(self);
            }, false);

            self.canvas.addEventListener('mouseleave', function(){
                self.isDrawing = false;
                self.points = [];
                
                storeImage(self);
            }, false);
            
            if (typeof options.data !== 'undefined') {
                importData(self, options.data);
            }
        },
        canDraw: function(szCanvasObj, state){
            var self = szCanvasObj;
            if (typeof options.state === 'boolean') {
                self.canDraw = state;
            }
        },
        clearCanvas: function(szCanvasObj){
            return clearCanvas(szCanvasObj);
        },
        exportImageToBase64: function(szCanvasObj){
            var self = szCanvasObj;
            return exportImageToBase64(self.canvas);
        },
        setResponsive: function(szCanvasObj, state){
            return setResponsive(szCanvasObj, state);
        },
        getCanvas: function(szCanvasObj){
            return getCanvas(szCanvasObj);
        },
        getSelf: function(szCanvasObj){
            return getSelf(szCanvasObj);
        },
        setMode: function(szCanvasObj, mode){
            return setMode(szCanvasObj, mode);
        },
        setColor: function(szCanvasObj, color){
            return setColor(szCanvasObj, color);
        },
        setPointSize: function(szCanvasObj, size){
            return setPointSize(szCanvasObj, size);
        },
        exportData: function(szCanvasObj){
            return exportData(szCanvasObj);
        },
        importData: function(szCanvasObj, data){
            return importData(szCanvasObj, data);
        },
    };
    
    $.fn.szPosteriorEyeCanvas = function(params){
        var self = this.get(0);
        
        if (methods[params]) {
            return methods[params].call(this, self, Array.prototype.slice.call(arguments, 1)[0]);
        } else if (typeof params === 'object'){
            methods.init(self, params);
        } else if (typeof params === 'undefined') {
            methods.init(self);
        } else {
            $.error('Method ' +  params + ' does not exist on jQuery.szPosteriorEyeCanvas');
        }
                
        return this;
    }
})(jQuery);