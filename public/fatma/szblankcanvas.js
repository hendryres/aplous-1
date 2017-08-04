/***********************************************
 *                                             *
 * szBlankCanvas.js                            *
 * -----------------------                     *
 * Created by Syukron Zahri                    *
 * Copyright (c) Syukron Zahri @ 2016          *
 * Copy is permitted without any modifications *
 *                                             *
 ***********************************************/

(function($){
    var backgroundImage = '<svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" width="8000" height="4000" viewBox="0 0 8000 4000" id="svg2" version="1.1"> <defs id="defs4" /> <metadata id="metadata7"> <rdf:RDF> <cc:Work rdf:about=""> <dc:format>image/svg+xml</dc:format> <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage" /> <dc:title></dc:title> </cc:Work> </rdf:RDF> </metadata> <circle r="1.5" cy="4000" cx="-2" style="fill:#000000;stroke:none" id="path4161" /></svg>';
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
        
        var cHeight = self.clientHeight;
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
    
    function rotateObject(coordinates, origin, degree)
    {
        var xNew, yNew;
        var newCoordinates = [];
        
        for (idx in coordinates) {
            xNew = ((Math.cos(degree / 180 * Math.PI) * (coordinates[idx].x - origin.x)) - (Math.sin(degree / 180 * Math.PI) * (coordinates[idx].y - origin.y))) + origin.x;
            yNew = ((Math.sin(degree / 180 * Math.PI) * (coordinates[idx].x - origin.x)) + (Math.cos(degree / 180 * Math.PI) * (coordinates[idx].y - origin.y))) + origin.y;
            
            newCoordinates.push({x: xNew, y: yNew});
        }
        
        return newCoordinates;
    }
    
    // function getArrow(type, origin, size, direction)
    // {
    //     var coordinate;
        
    //     switch (type) {
    //         case 'full':
    //             coordinate = [
    //                 {x: origin.x, y: origin.y + (size / 2)},
    //                 {x: origin.x, y: origin.y - (size / 2)},
    //                 {x: origin.x - (size / 2), y: origin.y},
    //                 {x: origin.x, y: origin.y - (size / 2)},
    //                 {x: origin.x + (size / 2), y: origin.y},
    //             ];
    //             break;
    //         case 'partial':
    //             coordinate = [
    //                 {x: origin.x, y: origin.y + (size / 2)},
    //                 {x: origin.x, y: origin.y - (size / 2)},
    //                 {x: origin.x - (size / 2), y: origin.y},
    //                 {x: origin.x, y: origin.y - (size / 2)},
    //                 {x: origin.x + (size / 2), y: origin.y},
    //                 {x: origin.x, y: origin.y - (size / 2)},
    //                 {x: origin.x - (size / 2), y: origin.y - (size / 2)},
    //                 {x: origin.x, y: origin.y - (size / 2)},
    //                 {x: origin.x + (size / 2), y: origin.y - (size / 2)},
    //             ];
    //             break;
    //         case 'none':
    //             coordinate = [
    //                 {x: origin.x, y: origin.y + (size / 2)},
    //                 {x: origin.x, y: origin.y - (size / 2)},
    //                 {x: origin.x - (size / 2), y: origin.y - (size / 2)},
    //                 {x: origin.x, y: origin.y - (size / 2)},
    //                 {x: origin.x + (size / 2), y: origin.y - (size / 2)},
    //             ];
    //             break;
    //     }
        
    //     var degree = 0;
        
    //     switch (direction) {
    //         case 'N':
    //             degree = 0;
    //             break;
    //         case 'NE':
    //             degree = 45;
    //             break;
    //         case 'E':
    //             degree = 90;
    //             break;
    //         case 'SE':
    //             degree = 135;
    //             break;
    //         case 'S':
    //             degree = 180;
    //             break;
    //         case 'SW':
    //             degree = 225;
    //             break;
    //         case 'W':
    //             degree = 270;
    //             break;
    //         case 'NW':
    //             degree = 315;
    //             break;
    //     }
        
    //     coordinate = rotateObject(coordinate, origin, degree);
    //     return coordinate;
    // }
    
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
        
        if (self.canDraw === true) {
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
    }

    // function insertArrow(szCanvasObj, coordinate)
    // {
    //     var self = szCanvasObj;
    //     var context = self.canvas.getContext('2d');
        
    //     if (self.canDraw === true) {
    //         var coordinate = getArrow(self.arrowMode, coordinate, self.canvas.width * 0.02752525, self.arrowDirection);
            
    //         //context.lineWidth = 20 * self.canvas.width / self.svg.clientWidth;
    //         context.globalCompositeOperation = 'source-over';
    //         context.lineWidth = 20 * self.canvas.width / 8000;
    //         context.strokeStyle = self.pointColor;
    //         context.lineJoin = 'round';
    //         context.lineCap = 'round';
    //         context.fillStyle = self.pointColor;
            
    //         for (var i = 0; i < coordinate.length; i++) {
    //             if (i < (coordinate.length - 1)) {
    //                 context.beginPath();
    //                 context.moveTo(coordinate[i].x, coordinate[i].y);
    //                 context.lineTo(coordinate[i + 1].x, coordinate[i + 1].y);
    //                 context.stroke();
    //             }
    //         }
    //     }
    // }
    
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
        self.previousDimension.y = self.clientHeight;
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
        
        var nHeight = self.clientWidth / 2;
        var nWidth = self.clientWidth;
        var cHeight = nHeight + self.style.paddingTop;
        
        self.style.height = nHeight + 'px';
        self.container.style.height = cHeight;
        
        self.svg.setAttribute('height', nHeight);
        self.svg.setAttribute('width', nWidth);
        
        self.canvas.setAttribute('height', nHeight);
        self.canvas.setAttribute('width', nWidth);
        
        //setCursor(self);
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

    // function setArrowMode(szCanvasObj, arrowMode)
    // {
    //     var self = szCanvasObj;
    //     self.arrowMode = arrowMode;
    //     setCursor(self);
    // }

    // function getArrowMode(szCanvasObj)
    // {
    //     var self = szCanvasObj;
    //     return self.arrowMode;
    // }

    // function setArrowDirection(szCanvasObj, arrowDirection)
    // {
    //     var self = szCanvasObj;
    //     self.arrowDirection = arrowDirection;
    //     setCursor(self);
    // }

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
                
                // if (self.mode == 'arrow') {
                //     insertArrow(self, {x: self.mouse.x, y: self.mouse.y});
                // }
                
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
        // setArrowMode: function(szCanvasObj, arrowMode){
        //     return setArrowMode(szCanvasObj, arrowMode);
        // },
        // setArrowDirection: function(szCanvasObj, arrowDirection){
        //     return setArrowDirection(szCanvasObj, arrowDirection);
        // },
        // getArrowMode: function(szCanvasObj){
        //     return setArrowDirection(szCanvasObj);
        // },
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
    
    $.fn.szBlankCanvas = function(params){
        var self = this.get(0);
        
        if (methods[params]) {
            return methods[params].call(this, self, Array.prototype.slice.call(arguments, 1)[0]);
        } else if (typeof params === 'object'){
            methods.init(self, params);
        } else if (typeof params === 'undefined') {
            methods.init(self);
        } else {
            $.error('Method ' +  params + ' does not exist on jQuery.szBlankCanvas');
        }
                
        return this;
    }
})(jQuery);