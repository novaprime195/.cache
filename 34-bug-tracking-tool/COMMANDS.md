# Quick Command Reference ⚡

## Complete Setup (Copy-Paste Ready)

### Build + Run (One Command)
```bash
docker build -t bug-tracker:latest . && docker run -d -p 5000:5000 --name bug-tracker-app bug-tracker:latest
```

### Build + Run + Open Browser
```bash
docker build -t bug-tracker:latest . && docker run -d -p 5000:5000 --name bug-tracker-app bug-tracker:latest && echo "✅ App running at http://localhost:5000"
```

---

## Individual Commands

### 1. Build Image
```bash
docker build -t bug-tracker:latest .
```

### 2. Run Container
```bash
docker run -d -p 5000:5000 --name bug-tracker-app bug-tracker:latest
```

### 3. Push to Docker Hub
```bash
# Login first
docker login

# Tag & Push (all in one)
docker tag bug-tracker:latest YOUR_USERNAME/bug-tracker:latest && docker push YOUR_USERNAME/bug-tracker:latest
```

---

## Management Commands

### Stop Container
```bash
docker stop bug-tracker-app
```

### Remove Container
```bash
docker rm bug-tracker-app
```

### Stop & Remove (One Command)
```bash
docker stop bug-tracker-app && docker rm bug-tracker-app
```

### View Logs
```bash
docker logs bug-tracker-app
```

### View Live Logs
```bash
docker logs -f bug-tracker-app
```

### Restart Container
```bash
docker restart bug-tracker-app
```

---

## Pull & Run from Docker Hub

```bash
docker pull YOUR_USERNAME/bug-tracker:latest && docker run -d -p 5000:5000 --name bug-tracker-app YOUR_USERNAME/bug-tracker:latest
```

---

## Automated Setup
```bash
chmod +x setup.sh && ./setup.sh
```

---

## Access Application
**URL:** http://localhost:5000
