"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var debug_1 = __importDefault(require("debug"));
var dotenv_1 = __importDefault(require("dotenv"));
var express_1 = __importDefault(require("express"));
var http_1 = __importDefault(require("http"));
var socket_io_1 = __importDefault(require("socket.io"));
var prometheus = __importStar(require("socket.io-prometheus-metrics"));
var serverDebug = debug_1.default('server');
dotenv_1.default.config(process.env.NODE_ENV === 'development'
    ? { path: '.env.development' }
    : { path: '.env.production' });
var app = express_1.default();
var port = process.env.PORT || 8081; // default port to listen
app.get('/', function (req, res) {
    res.send('Excalidraw backend is up :)');
});
var server = http_1.default.createServer(app);
server.listen(port, function () {
    serverDebug("listening on port: " + port);
});
var io = socket_io_1.default(server, {
    handlePreflightRequest: function (req, res) {
        var _a, _b;
        var headers = {
            'Access-Control-Allow-Headers': 'Content-Type, Authorization',
            'Access-Control-Allow-Origin': (_b = (_a = req.header) === null || _a === void 0 ? void 0 : _a.origin) !== null && _b !== void 0 ? _b : 'https://meet.jit.si',
            'Access-Control-Allow-Credentials': true
        };
        res.writeHead(200, headers);
        res.end();
    },
    maxHttpBufferSize: 2e6,
    pingTimeout: 10000
});
// listens on host:9090/metrics
prometheus.metrics(io, {
    port: 9091,
    collectDefaultMetrics: true
});
io.on('connection', function (socket) {
    serverDebug("connection established! " + socket.conn.request.url);
    io.to("" + socket.id).emit('init-room');
    socket.on('join-room', function (roomID) {
        serverDebug(socket.id + " has joined " + roomID + " for url " + socket.conn.request.url);
        socket.join(roomID);
        if (io.sockets.adapter.rooms[roomID].length <= 1) {
            io.to("" + socket.id).emit('first-in-room');
        }
        else {
            socket.broadcast.to(roomID).emit('new-user', socket.id);
        }
        io.in(roomID).emit('room-user-change', Object.keys(io.sockets.adapter.rooms[roomID].sockets));
    });
    socket.on('server-broadcast', function (roomID, encryptedData, iv) {
        socket.broadcast.to(roomID).emit('client-broadcast', encryptedData, iv);
    });
    socket.on('server-volatile-broadcast', function (roomID, encryptedData, iv) {
        socket.volatile.broadcast
            .to(roomID)
            .emit('client-broadcast', encryptedData, iv);
    });
    socket.on('disconnecting', function () {
        var rooms = io.sockets.adapter.rooms;
        for (var _i = 0, _a = Object.keys(socket.rooms); _i < _a.length; _i++) {
            var roomID = _a[_i];
            var clients = Object.keys(rooms[roomID].sockets).filter(function (id) { return id !== socket.id; });
            if (roomID !== socket.id) {
                socket.to(roomID).emit('user has left', socket.id);
            }
            if (clients.length > 0) {
                socket.broadcast.to(roomID).emit('room-user-change', clients);
            }
        }
    });
    socket.on('disconnect', function (reason, details) {
        serverDebug(socket.id + " was disconnected from url " + socket.conn.request.url + " for the following reason: " + reason + "\n            " + (details === null || details === void 0 ? void 0 : details.message) + "\n            " + (details === null || details === void 0 ? void 0 : details.description));
        socket.removeAllListeners();
    });
});
