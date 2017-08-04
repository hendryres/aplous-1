/***********************************************
 *                                             *
 * szAnteriorEyeCanvas.js                     *
 * -----------------------                     *
 * Created by Syukron Zahri                    *
 * Copyright (c) Syukron Zahri @ 2016          *
 * Copy is permitted without any modifications *
 *                                             *
 ***********************************************/

(function($){
    var backgroundImage = '<svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="1.1" id="svg2" viewBox="0 0 4251.9691 850.39368" height="240mm" width="1200mm"><defs id="defs4" /><metadata id="metadata7"><rdf:RDF><cc:Work rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><path style="fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:16.00000381;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" d="m 33.768262,421.98802 c 0,0 252.496538,-385.08941 964.059448,-385.08941 711.56269,0 960.39019,385.08941 960.39019,385.08941" id="path4138" /><path style="fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:16.00000381;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" d="m 35.603021,425.2283 c 0,0 252.496539,385.08937 964.059469,385.08937 711.56271,0 960.39021,-385.08937 960.39021,-385.08937" id="path4138-1" /><circle style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:16.00000381;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" id="path4170" cx="996.91046" cy="422.04163" r="256.86478" /><path style="fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:16.00000381;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" d="M 1722.5535,422.04148 1838.1426,293.60914" id="path4172" /><path style="fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:16.00000381;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" d="m 1722.5535,422.04157 115.5891,128.43231" id="path4172-4" /><path style="fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:16.00000381;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" d="m 4224.9466,421.98802 c 0,0 -252.4966,-385.08941 -964.0595,-385.08941 -711.5627,0 -960.3902,385.08941 -960.3902,385.08941" id="path4138-8" /><path style="fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:16.00000381;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" d="m 4223.1118,425.2283 c 0,0 -252.4965,385.08937 -964.0595,385.08937 -711.5627,0 -960.3902,-385.08937 -960.3902,-385.08937" id="path4138-1-9" /><circle style="fill:none;fill-opacity:1;stroke:#000000;stroke-width:16.00000381;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" id="path4170-9" cx="-3261.8044" cy="422.04163" r="256.86478" transform="scale(-1,1)" /><path style="fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:16.00000381;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" d="M 2536.1613,422.04148 2420.5722,293.60914" id="path4172-2" /><path style="fill:none;fill-opacity:1;fill-rule:evenodd;stroke:#000000;stroke-width:16.00000381;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" d="M 2536.1613,422.04157 2420.5722,550.47388" id="path4172-4-9" /></svg>';
    
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
    
    $.fn.szAnteriorEyeCanvas = function(params){
        var self = this.get(0);
        
        if (methods[params]) {
            return methods[params].call(this, self, Array.prototype.slice.call(arguments, 1)[0]);
        } else if (typeof params === 'object'){
            methods.init(self, params);
        } else if (typeof params === 'undefined') {
            methods.init(self);
        } else {
            $.error('Method ' +  params + ' does not exist on jQuery.szAnteriorEyeCanvas');
        }
                
        return this;
    }
})(jQuery);